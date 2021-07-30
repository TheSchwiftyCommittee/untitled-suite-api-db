class AdminDirectorsController < ApplicationController
    
    before_action :authorized, only: [:auto_login]
    before_action :check_admin_director, only: [:user_index , :delete_user, :delete_admin, :assign_admin, :unassign_admin]

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

      # DELETE ADMIN
      def delete_admin
        @user = User.find_by(email: params[:email])
            if @user.admin == true
                @user.destroy
                render json: {notice: "User was successfully Deleted." }
            else
                render json: {notice: "Cannot delete user of admin status." }
            end
    end
  
    # ASSIGN USER
    def assign_admin
        @user = User.find_by(email: params[:email])
        @user.admin = true
        @user.save
        render json: {notice: "User was successfully assgined Admin role." }
    end

        # UNASSIGN USER
        def unassign_admin
            @user = User.find_by(email: params[:email])
            @user.admin = false
            @user.save
            render json: {notice: "User was successfully unassgined Admin role." }
        end

    private

    # CHECK IF USER IS ADMIN DIRECTOR
    def check_admin_director
        @user = User.find_by(username: params[:username])
            if @user.admin_director == true
            else 
               render json: {error: 'You are not allowed to access this part of the site'}
            end
    end
end