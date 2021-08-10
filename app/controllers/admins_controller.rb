class AdminsController < ApplicationController
    
  before_action :check_admin
  before_action :find_user

  # DISPLAY ALL USERS
  def user_index 
    @users = User.all
    render json: @users
  end
  
  # DELETE USER
  def delete_user
    if @user.admin == false && @user.admin_director == false
      @user.destroy
      render json: {notice: "User was successfully Deleted." }, status: :ok
    else
      render json: {notice: "Cannot delete user of admin status." }, status: :unauthorized
    end
  end
  
  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  # CHECK IF USER IS ADMIN
  def check_admin
    @current_user = User.find_by(username: params[:username])
    if @current_user.admin == true && decoded_token[0]["user_id"] == @current_user.id 
    else 
      render json: {error: 'You are not allowed to access this part of the site'}, status: 401
    end
 end
end