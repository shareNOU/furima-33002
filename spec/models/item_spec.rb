require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep 0.1
  end
  describe "出品できるとき" do
    it "全ての項目が存在すとき出品できる" do
      expect(@item).to be_valid
    end
  end

  describe "出品できないとき" do
    it "出品画像が空のとき出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が空のとき出品できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が空のとき出品できない" do
      @item.explain = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end
    it "カテゴリーが空のとき出品できない" do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it "商品の状態が空のとき出品できない" do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not a number")
    end
    it "配送料の負担が空のとき出品できない" do
      @item.shopping_charge = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping charge is not a number")
    end
    it "発送元の地域が空のとき出品できない" do
      @item.shopping_area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping area is not a number")
    end
    it "発送までの日数が空のとき出品できない" do
      @item.days_to_ship = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship is not a number")
    end
    it "販売価格が空のとき出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
  end
end
