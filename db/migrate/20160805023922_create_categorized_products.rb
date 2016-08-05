class CreateCategorizedProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :categorized_products do |t|
      t.integer :product_id
      t.integer :category_id
      
      t.timestamps
    end
  end
end
