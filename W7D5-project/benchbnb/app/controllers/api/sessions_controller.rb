class Api::SessionsController < ApplicationController
  # def new
  # end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login(@user)
      render :show
    else
        render json: ["Invalid Credentials"], status: 401
    end
  end

  def destroy

    if logged_in
      logout
      render {}
    else
      render json: { error: error.message }, status: 404
    end
  end

end
