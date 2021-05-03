class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.authenticate(params[:username], params[:password])
    if @user 
       session[:user_id] = @user.id
       redirect_to '/welcome'
    else
       redirect_to '/login'  
    end
  end

  def login
  end

  def welcome
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/welcome'
  end

  def page_requires_login
  end

  
end
