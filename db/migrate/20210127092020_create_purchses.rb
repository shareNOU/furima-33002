class CreatePurchses < ActiveRecord::Migration[6.0]
  def change
    create_table :purchses do |t|
      t.references :user, presence: true
      t.references :item, presence: true
      t.timestamps
    end
  end
end
