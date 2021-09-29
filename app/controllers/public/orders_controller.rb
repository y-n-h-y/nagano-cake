class Public::OrdersController < ApplicationController
  def new
    @addresses = current_customer.address
    @order = Order.new
  end

  def confilm
    @order = Order.new(order_params)
    
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @cart_items = current_customer.cart_items
    @total = 0
    @cart_items.each do |cart_item| 
      total = cart_item.item.tax_price * cart_item.amount
    @total += total
    @billing = @total + 750
    @name = cart_item.item.name
    @tax_price = cart_item.item.tax_price
    end
    
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 750
    @order.status = 0
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.making_status = 0
      @order_detail.price = cart_item.item.tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    CartItem.destroy_all
    redirect_to complete_orders_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @total = 0
    @order_details.each do |order_detail|
    @subtotal = order_detail.price * order_detail.amount
    @total += @subtotal
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name, :price)
  end
end
