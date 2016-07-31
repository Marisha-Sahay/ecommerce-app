class ProductsController < ApplicationController

  def index
    if params[:sort]
      @products = Product.order(price: params[:sort])
    elsif params[:discount]
      @products = Product.where("price < ?", 15)
    else
      @products = Product.all
    end
  end


  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new
  end

  def create
    name = params[:name]
    description = params[:description]
    price = params[:price]
    size = params[:size]
    image = params[:image]
    product = Product.new(name: name,description: description,price: price,size: size,image: image)
    product.save 
    flash[:success] = "Product created"
    redirect_to "/products/#{product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])

  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name]
    product.description = params[:description]
    product.price = params[:price]
    product.size = params[:size]
    product.image = params[:image]
    product.save
    flash[:success] = "Product updated"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.delete
    flash[:danger] = "Product deleted"
    redirect_to "/products"
  end

  def search
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%")
    render :index
  end


end
