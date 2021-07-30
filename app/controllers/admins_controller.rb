class AdminsController < ApplicationController
    
    before_action :authorized, only: [:auto_login]
    before_action :check_admin, only: [:user_index , :delete_user]

    # DISPLAY ALL USERS
    def user_index 
        @users = User.all
        render json: @users
      end
  
    # DELETE USER
    def delete_user
        @user = User.find_by(email: params[:email])
            if @user.admin == false
                @user.destroy
                render json: {notice: "User was successfully Deleted." }
            else
                render json: {notice: "Cannot delete user of admin status." }
            end
    end
  
     private

    # CHECK IF USER IS ADMIN
    def check_admin
        @user = User.find_by(username: params[:username])
            if @user.admin == true 
            else 
               render json: {error: 'You are not allowed to access this part of the site'}
            end
    end
end