class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @addresse = Address.new
    @customer = current_customer
  end
  
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    addresse = Address.find(params[:id])
    addresse.destroy
    redirect_to addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end
end
