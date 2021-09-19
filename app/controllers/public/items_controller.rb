class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).order(:id)
    @count = Item.count
  end

  def show
    @item = Item.find(params[:id])
  end
end
