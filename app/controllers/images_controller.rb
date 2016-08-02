class ImagesController < ApplicationController

  def new
  end

  def create
    image_url = params[:url]
    image = Image.new(url: image_url, product_id: params[:product][:product_id])
    image.save
    flash[:success] = "Image created"
    redirect_to "/products/#{image.product_id}"
  end

end
