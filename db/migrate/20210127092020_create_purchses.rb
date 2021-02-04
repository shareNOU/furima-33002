class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user, presence: true
      t.references :item, presence: true
      t.timestamps
    end
  end
end
