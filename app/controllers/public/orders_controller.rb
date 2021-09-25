class Public::OrdersController < ApplicationController
  def new
    @addresses = Addresse.all
    @order = Order.new
  end

  def confilm
    binding.pry
    @order = Order.new(order_params)
    
  end

  def complete
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment, :postal_code, :addresses, :name)
  end
end
