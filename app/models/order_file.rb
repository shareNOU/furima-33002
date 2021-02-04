class OrderFile
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shopping_area_id, :city, :address, :building, :number, :purchase_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is out of setting range"}
    validates :shopping_area_id, numericality: { other_than: 0 } do
    validates :city
    validates :address
    validates :number, format: {with:/\A\d{11}\z/, message: "is out of setting range"}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shopping_area_id: shopping_area_id, city: city, address: address, building: building, number: number, purchase_id: purchase.id)
  end

end
