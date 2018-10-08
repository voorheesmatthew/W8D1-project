class Api::UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render :show
    else
      render json: { error: error.message }, "Username Already Exists", status: 422
    end
  end

    def show
      render :show(params[:id])
    end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
