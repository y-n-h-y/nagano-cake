class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).order(:id)
    @order_detail = OrderDetail.find_by(params[:id])
  end
end
