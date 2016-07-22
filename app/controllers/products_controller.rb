class ProductsController < ApplicationController
  def all_product
    @products = Product.all
  end

end
