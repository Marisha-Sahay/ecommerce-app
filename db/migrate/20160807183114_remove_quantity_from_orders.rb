class RemoveQuantityFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :quantity, :integer
    add_column :carted_products, :quantity, :integer, default:0
  end
end
