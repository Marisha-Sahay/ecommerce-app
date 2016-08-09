class Product < ApplicationRecord
belongs_to :supplier
has_many :images
has_many :categorized_products
has_many :categories, through: :categorized_products
has_many :carted_products
has_many :orders, through: :carted_products

TAXRATE = 0.09

  def sale_message
    if price.to_i < 15
      return "discount_item"
    else
      return "On Sale!!!"
    end
  end

  def tax
    price.to_i * TAXRATE
  end

  def total
    tax + price.to_f
  end

 end
