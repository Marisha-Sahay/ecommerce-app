class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :image, :url
  end
end
