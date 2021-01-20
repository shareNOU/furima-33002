class ItemsController < ApplicationController
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

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :condition_id, :price, :shopping_charge_id, :shopping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

end
