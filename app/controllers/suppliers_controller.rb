class SuppliersController < ApplicationController
  def new
  end

  def index
      @suppliers = Supplier.all
  end

  def show
      @supplier = Supplier.find_by(id: params[:id])
  end

  def create
    name = params[:name]
    email = params[:email]
    phone = params[:phone]
    supplier = Supplier.new(name: name,email: email,phone: phone)
    supplier.save 
    flash[:success] = "Supplier created"
    redirect_to "/suppliers/#{supplier.id}"
  end

  def edit
    @supplier = Supplier.find_by(id: params[:id])

  end

  def update
    supplier = Supplier.find_by(id: params[:id])
    supplier.name = params[:name]
    supplier.email = params[:email]
    supplier.phone = params[:phone]
    supplier.save
    flash[:success] = "Supplier updated"
    redirect_to "/suppliers/#{supplier.id}"
  end

  def destroy
    supplier = Supplier.find_by(id: params[:id])
    supplier.delete
    flash[:danger] = "Supplier deleted"
    redirect_to "/suppliers"
  end

end
