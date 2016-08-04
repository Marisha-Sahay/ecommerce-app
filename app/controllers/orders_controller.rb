class OrdersController < ApplicationController
  def new
  end

  def create
    if !current_user
      flash[:warning] = "You need to login to make order"
      redirect_to '/login'
    else
    product = Product.find_by(id: params[:product_id])
    p product
    subtotal = params[:quantity].to_i * product.price
    tax = 0.09 * product.price
    total = subtotal + tax
    order = Order.new(quantity: params[:quantity], user_id: current_user.id, product_id: product.id, subtotal: subtotal, tax: tax, total: total)
    if order.save

      flash[:success] = 'Your order has been placed'
      redirect_to "/orders/#{order.id}"
    else
      redirect_to '/products'
      flash[:danger] = "Your order could not be placed. Please try again"
    end
  end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
