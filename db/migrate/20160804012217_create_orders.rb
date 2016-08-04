class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.decimal :subtotal, precision: 5, scale: 2
      t.integer :quantity
      t.decimal :tax, precision: 5, scale: 2
      t.decimal :total, precision: 5, scale: 2

      t.timestamps
    end
  end
end
