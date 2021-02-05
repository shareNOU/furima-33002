class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:create, :index]
  def index 
    if @item.user.id == current_user.id || @item.purchase.present?
      redirect_to root_path
    else
      @order_file = OrderFile.new
    end
  end

  def create
    @order_file = OrderFile.new(order_params)
    if @order_file.valid?
      pay_item
      @order_file.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:order_file).permit(:postal_code, :shopping_area_id, :city, :address, :building, :number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:@item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
