class PurchasesController < ApplicationController
  before_action :require_student, only: [:index] 
  before_action :require_student_login, only: [:new, :create]
  before_action :set_purchase, only: [:show, :destroy]
  before_action :require_owner, only: [:delete]
  before_action :require_admin_or_owner, only: [:show]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.where(student_id: current_user.id)
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @errors = []
    @compiled = []
    current_user.cart.cart_items.each do |cart_item|
      @purchase = current_user.purchases.build()
      @purchase.student = current_user
      @purchase.section = cart_item.section
      @purchase.price = cart_item.section.course.price
      unless @purchase.save
        @errors.append @purchase.errors
      else
        @compiled.append @purchase
        cart_item.destroy
      end
    end
    
    if @compiled.any?
      message = StudentMailer.purchase_email(current_user_auth, @compiled).deliver!
    end

    respond_to do |format|
      unless @errors.any?
        format.html { redirect_to purchases_url, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: purchases_url }
      else
        format.html { render :new  }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def is_owner?
      is_student_login? and current_user.id == @purchase.student.id
    end

    def require_owner
      unless is_owner?
        redirect_to home_url, notice: NOT_AUTHORIZED
      end 
    end

    def require_admin_or_owner
      unless is_admin_login? or is_owner_logged_in?
        redirect_to home_url, notice: NOT_AUTHORIZED
      end
    end
end
