class OrdersController < ApplicationController
  
  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
    order = Order.find_by(id: params[:id])

    total_tax = 0
    total_subtotal = 0
    order.carted_products.each do |carted_product|
      total_subtotal += (carted_product.product.price * carted_product.quantity)
      total_tax += (carted_product.product.tax * carted_product.quantity)
    end
    total = total_subtotal + total_tax
    order.assign_attributes(complete: true, tax: total_tax, subtotal: total_subtotal, total: total)
    order.save
    redirect_to "/orders/#{order.id}"
  end
end