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
    #@section = Section.find(params[:section_id])
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    current_user.cart.cart_items.each do |cart_item|

      @purchase = current_user.purchases.build(purchase_params)
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

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
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

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.permit(:student_id, :section_id, :price)
    end
end
