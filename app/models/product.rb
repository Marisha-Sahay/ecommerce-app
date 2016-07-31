class Product < ApplicationRecord

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
