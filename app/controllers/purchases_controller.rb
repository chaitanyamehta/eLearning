class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
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
    current_user.cart.cart_items.each do |cart_item|

      @purchase = current_user.purchases.build()
      @purchase.student = current_user
      @purchase.section = cart_item.section
      @purchase.price = cart_item.section.course.price
      @err = @purchase.save
      unless @err
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @purchase.errors, status: :unprocessable_entity }
        end
      end
      cart_item.destroy
    end
    respond_to do |format|
        format.html { redirect_to '/purchases', notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
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
end
