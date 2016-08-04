class Product < ApplicationRecord
belongs_to :supplier
has_many :images
has_many :orders

  def sale_message
    if price.to_i < 15
      return "discount_item"
    else
      return "On Sale!!!"
    end
  end

  def tax
    price.to_f * 0.09
  end

  def total
    tax + price.to_f
  end

 end
