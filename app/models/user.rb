class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  with_options presence: true do
    validates :nickname
    validates :email,            format: {with: VALID_EMAIL_REGEX}
    validates :password_confirmation
    validates :first_name,       format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name,      format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana,  format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  has_many :items
  has_one :purchase
end
