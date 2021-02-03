class OrderFile
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shopping_area_id, :city, :address, :building, :number, :purchse_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is out of setting range"}
    validates :shopping_area_id
    validates :city
    validates :address
    validates :number, format: {with:/\A\d{11}\z/, message: "is out of setting range"}
    validates :token
  end

  with_options numericality: { other_than: 0 } do
    validates :shopping_area_id
  end
  

  def save
    purchse = Purchse.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shopping_area_id: shopping_area_id, city: city, address: address, building: building, number: number, purchse_id: purchse.id)
  end

end
