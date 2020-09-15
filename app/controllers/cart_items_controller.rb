class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:destroy]
  
  # GET /cart
  def index
    @cart_items = current_user.cart.cart_items
  end

  # GET /courses/:course_id/add_to_cart
  def new
    @course = Course.find(params[:course_id])
    @cart_item = CartItem.new
  end

  # POST /cart_items
  def create
    @cart_item = current_user.cart.cart_items.build(cart_item_params)
    if @cart_item.save
      redirect_to courses_url, notice: 'Course was added in cart.'
    else
      render :new
    end
  end

  # DELETE /cart_items/:id
  def destroy
    @cart_item.destroy
    redirect_to cart_url, notice: 'Course was successfully removed.'
  end

  # DELETE /cart_items/clear
  def clear
    current_user.cart.cart_items.destroy_all
    redirect_to cart_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:section_id)
    end
end
