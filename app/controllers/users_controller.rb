class UsersController < ApplicationController

    before_action :authorized, only: [:auto_login]
  
    # REGISTER
    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end

    # UPDATE
    def update
      @user = User.find_by(email: params[:email])
        if @user.update(user_params) 
        render json: {notice: "User was successfully updated."}
      else
        render json: {error: "User was not updated"}, status: 401
      end
    end

    # DELETE
    def delete_account
      @user = User.find_by(email: params[:email])
      if decoded_token[0]["user_id"] == @user.id
        @user.destroy
        if @user.destroy
          render json: {notice: "User was successfully deleted."}
        else
          render json: {error: "User was not deleted"}, status: 401
        end
      else 
        render json: {error: "You are not allowed to deleted other useraccounts."}, status: :unauthorized
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
