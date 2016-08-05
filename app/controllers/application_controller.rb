  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :human_date_and_time

    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def human_date_and_time(date)
      date.strftime("%b %e, %l:%M %p")
    end

    

  end
