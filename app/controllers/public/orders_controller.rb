class Public::OrdersController < ApplicationController
  def new
    @addresses = Addresse.all
  end

  def confilm
    @cart_items = CartItem.all
    
    session[:customer] = Order.new()
    
    if params[:select_address] == "0"
      session[:customer][:postal_code] = current_customer.postal_code
      session[:customer][:addresses] = current_customer.addresses
      session[:customer][:name] = current_customer.full_name
    elsif params[:select_address] == "1"
      session[:customer][:postal_code] = Addresse.find(params[:addresse_id]).postal_code
      session[:customer][:postal_code] = Addresse.find(params[:addresse_id]).addresses
      session[:customer][:postal_code] = Addresse.find(params[:addresse_id]).name
    else
      session[:customer][:postal_code] = params[:postal_code]
      session[:customer][:postal_code] = params[:addresses]
      session[:customer][:postal_code] = params[:name]
    end
    
    redirect_to orders_path
  end

  def complete
  end

  def create
    @order = Order.new(session[:customer])
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
