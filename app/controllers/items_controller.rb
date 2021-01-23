class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :edit]
  before_action :set_tweet, only: [:edit, :show, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user != @item.user 
    redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :condition_id, :price, :shopping_charge_id, :shopping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end

end
