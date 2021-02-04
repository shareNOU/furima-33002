require 'rails_helper'

RSpec.describe OrderFile, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_file = FactoryBot.build(:order_file, user_id: @user.id , item_id: @item.id)
    sleep 0.1
  end

  describe "購入できる" do
    it "全ての項目が存在するとき" do
      expect(@order_file).to be_valid
    end
    it "建物名が空でも保存できる" do
      @order_file.building = ""
      expect(@order_file).to be_valid
    end
  end

  describe "購入できない" do
    it "郵便番号が空のとき" do
      @order_file.postal_code = nil
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Postal code can't be blank")
    end
    it "都道府県が空のとき" do
      @order_file.shopping_area_id = nil
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Shopping area can't be blank")
    end
    it "市区町村が空のとき" do
      @order_file.city = nil
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空のとき" do
      @order_file.address = nil
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号が空のとき" do
      @order_file.number = nil
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Number can't be blank")
    end
    it "郵便番号にハイフンが無いとき" do
      @order_file.postal_code = "1234567"
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Postal code is out of setting range")
    end
    it "電話番号にハイフンがあるとき" do
      @order_file.number = "000-0000-0000"
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Number is out of setting range")
    end
    it "電話番号が10桁以下のとき" do
      @order_file.number = "0000000000"
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Number is out of setting range")
    end
    it "電話番号が12桁以上のとき" do
      @order_file.number = "000000000000"
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Number is out of setting range")
    end
    it "都道府県が0のとき" do
      @order_file.shopping_area_id = 0
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Shopping area must be other than 0")
    end
    it "tokenが空のとき" do
      @order_file.token = nil
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Token can't be blank")
    end
    it "use_idが空のとき" do
      @order_file.user_id = nil
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空のとき" do
      @order_file.item_id = nil
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Item can't be blank")
    end
    it "電話番号が半角英数字混合のとき" do
      @order_file.number = "0a0a0a0a0a0"
      @order_file.valid?
      expect(@order_file.errors.full_messages).to include("Number is out of setting range")
    end
  end
end

