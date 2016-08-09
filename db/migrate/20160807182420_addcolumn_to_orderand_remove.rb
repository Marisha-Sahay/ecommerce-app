class AddcolumnToOrderandRemove < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :product_id, :integer
    add_column :orders, :complete, :boolean, default:false
  end
end
