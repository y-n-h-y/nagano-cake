class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @items = Item.all
    @total = 0
    @cart_items.each do |cart_item| 
      total = cart_item.item.tax_price * cart_item.amount
    @total += total
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
