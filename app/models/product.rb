class Product < ApplicationRecord

  def sale_message
    if price.to_f < 2
      return "Discount item!"
    else
      return "On Sale!"
    end
  end

  def tax
    tax = (price.to_f * 9)/100
    return tax
  end

  def total
    return self.tax + price.to_f
  end

end
