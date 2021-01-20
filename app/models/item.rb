class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_charge
  belongs_to :shopping_area
  belongs_to :days_to_ship

  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :price
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shopping_charge_id
    validates :shopping_area_id
    validates :days_to_ship_id
  end

  belongs_to :user
end
