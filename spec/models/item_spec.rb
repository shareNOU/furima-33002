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
    it "カテゴリーが0のとき出品できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "商品の状態が0のとき出品できない" do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 0")
    end
    it "配送料の負担が0のとき出品できない" do
      @item.shopping_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping charge must be other than 0")
    end
    it "発送元の地域が0のとき出品できない" do
      @item.shopping_area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping area must be other than 0")
    end
    it "発送までの日数が0のとき出品できない" do
      @item.days_to_ship_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 0")
    end
    it "価格が全角文字のとき出品できない" do
      @item.price = "１１１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it "価格が半角英数混合のとき出品できない" do
      @item.price = "1a1a1a"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it "価格が半角英語のみのとき出品できない" do
      @item.price = "aaaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it "価格が￥299以下のとき出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it "価格が￥10000000以上のとき出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

  end
end
