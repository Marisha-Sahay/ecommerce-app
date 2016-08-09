class CreateCartedProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :carted_products do |t|
      t.integer :product_id
      t.integer :order_id

      t.timestamps
    end
  end
end
