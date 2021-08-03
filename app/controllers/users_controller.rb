class UsersController < ApplicationController

    before_action :authorized, only: [:auto_login]
  
    # REGISTER
    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}, status: 401
      end
    end

    # UPDATE
    def update
      @user = User.find_by(email: params[:email])
        if @user.update(user_params) 
        render json: {notice: "User was successfully updated." }
      else
        render json: {error: "User was not updated"}, status: 401
      end
    end

    # LOGGING IN
    def login
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}, status: 401
      end
    end
    
    # AUTO LOGIN
    def auto_login
      render json: @user
    end

    private
  
    def user_params
      params.permit(:username, :email, :password)
    end
end
