class UsersController < ApplicationController


def new
  @user = User.new
end

def create
  @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = user.id
    redirect_to "/"
  else
    flash[:warning] = "User not created"
    render 'new'
  end
end

end