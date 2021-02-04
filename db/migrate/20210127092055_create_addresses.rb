class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :shopping_area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :number, null: false
      t.references :purchase, presence: true
      t.timestamps
    end
  end
end
