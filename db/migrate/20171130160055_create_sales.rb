class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.string :purchaser_name
      t.text :item_description
      t.decimal :item_price, precision: 8, scale: 2
      t.integer :purchaser_count
      t.string :merchant_address
      t.string :merchant_name

      t.timestamps
    end
  end
end
