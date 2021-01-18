require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "すべての項目が存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordとpassword_confirmationが6文字以上の半角英数字であれば登録できる" do
      @user.password = "1a1a1a1"
      @user.password_confirmation = "1a1a1a1"
      expect(@user).to be_valid
    end
  end

  context '新規登録がうまくいかないとき' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "nicknameが空では登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "1a1a1a1"
      @user.password_confirmation = "1a1a1a1a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_nameが空では登録できない" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空では登録できない" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birth_dateが空では登録できない" do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
    it "passwordが5文字以下では登録できない" do
      @user.password = "1a1a1"
      @user.password_confirmation = "1a1a1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'family_nameが全角入力でなければ登録できないこと' do
      @user.family_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it 'first_nameが全角入力でなければ登録できないこと' do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.family_name_kana = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name_kana = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'emailに@が含まれていなければ登録できないこと' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
  end
end
