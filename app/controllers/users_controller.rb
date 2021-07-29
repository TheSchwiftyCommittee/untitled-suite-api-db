class UsersController < ApplicationController

    before_action :authorized, only: [:auto_login]
    before_action :check_admin, only: [:admin_index, :admin_delete_user, :admin_assign_user]
  
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
        render json: {notice: "User was successfully updated." }
        else
          render json: {error: "User was not updated"}
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
    
      # AUTO LOGIN
    def auto_login
      render json: @user
    end

    # DISPLAY ALL USERS
    def admin_index 
      @users = User.all
      render json: @users
    end

    # DELETE USER
    def admin_delete_user
      @user = User.find_by(email: params[:email])
      if @user.admin == false
         @user.destroy
         render json: {notice: "User was successfully Deleted." }
      else
        render json: {notice: "Cannot delete user of admin status." }
      end
    end

    # ASSIGN USER
    def admin_assign_user
      @user = User.find_by(email: params[:email])
      @user.admin = true
      @user.save
      render json: {notice: "User was successfully assgined Admin." }
    end

     private
  
    def user_params
      params.permit(:username, :email, :password)
    end

    def check_admin
      @user = User.find_by(username: params[:username])
      if @user.admin == true 
      else 
        render json: {error: 'You are not allowed to access this part of the site'}
      end
    end
end
