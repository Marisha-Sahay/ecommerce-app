class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image
      t.string :product_id

      t.timestamps
    end
  end
end
