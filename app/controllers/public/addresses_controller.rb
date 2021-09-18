class Public::AddressesController < ApplicationController
  def index
    @addresses = Addresse.all
    @addresse = Addresse.new
  end
  
  def create
    @addresse = Addresse.new(addresse_params)
    @addresse.save
    redirect_to addresses_path
  end

  def edit
    @addresse = Addresse.find(params[:id])
  end

  def update
    @addresse = Addresse.find(params[:id])
    @addresse.update(addresse_params)
  end

  def destroy
  end
  
  private
  
  def addresse_params
    params.require(:addresse).permit(:name, :postal_code, :addresses)
  end
end
