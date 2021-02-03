class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index 
    @order_file = OrderFile.new
  end

  def create
    @order_file = OrderFile.new(order_params)
    if @order_file.valid?
      pay_item
      @order_file.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def order_params
    params.require(:order_file).permit(:user_id, :item_id, :postal_code, :shopping_area_id, :city, :address, :building, :number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      card: order_file_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
