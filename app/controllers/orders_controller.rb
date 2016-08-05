class OrdersController < ApplicationController
  def create
    if !current_user
      flash[:warning] = "You need to login to make order"
      redirect_to '/login'
    else
    quantity = params[:quantity].to_i
    product = Product.find_by(id: params[:product_id])
    p product
    subtotal = quantity * product.price
    tax = product.tax * quantity
    total = subtotal + tax
    order = Order.new(quantity: quantity, user_id: current_user.id, product_id: product.id, subtotal: subtotal, tax: tax, total: total)
    if order.save
      flash[:success] = 'Your order has been placed'
      redirect_to "/orders/#{order.id}"
    else
      redirect_to '/products/#{product.id}'
      flash[:danger] = "Your order could not be placed. Please try again"
    end
  end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
