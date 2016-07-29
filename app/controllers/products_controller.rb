    class ProductsController < ApplicationController

      def index
        sort_price = params[:sort_price]
        if sort_price == 'ASC'
          @products = Product.order(:price)
        elsif sort_price == 'DESC'
          @products = Product.order(price: :desc)
        else
          @products = Product.all
        end
      end

      def show
        @product = Product.find_by(id: params[:id])
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

    end
