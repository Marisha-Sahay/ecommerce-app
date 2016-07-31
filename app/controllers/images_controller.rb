class ImagesController < ApplicationController

  def new
  end

  def create
    url = params[:url]
    product_id = params[:product_id]
    img = Image.new(url: url, product_id:product_id)
    img.save
    flash[:success] = "Product created"
    redirect_to "/products/#{img.product.id}"
  end

end
