class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    if User.find_by(username: params[:username])
      render json: {error: "Username has been taken"}
    else
      @user = User.create(user_params)
      if @user.valid? &&
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
  end

  def show
    @single_user = User.where('username = ?', params[:username])
    if @single_user
      render :json => {
          :response => 'User found',
          :data => @single_user
      }
    else
      render :json => {
          :response => 'User not found'
      }
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end