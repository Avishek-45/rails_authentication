class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]


  def new
    @user = User.new 
  end

  def create
    
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
     params.require(:user).permit(:username, :password , :password_confirmation)
  end
end
