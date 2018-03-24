class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :type, null: false
      t.string :name, null: false
      t.float :product_price, limit: 53, null: false
      t.string :color
      t.integer :status, null: false
      t.date :inward_date, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
