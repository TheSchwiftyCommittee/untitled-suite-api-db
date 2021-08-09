class AdminDirectorsController < ApplicationController
     
 before_action :find_user
 before_action :check_admin_director
 
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
   render json: {error: "Cannot delete user of admin status." }, status: :unauthorized
  end
 end
 
 # DELETE ADMIN
 def delete_admin
  if @user.admin == true && @user.admin_director == false
   @user.destroy
   render json: {notice: "User was successfully Deleted." }, status: :ok
  else
   render json: {error: "Cannot delete user of admin status." }, status: :unauthorized
  end
 end
 
 # ASSIGN USER
 def assign_admin
  @user.admin = true
  @user.save
  @pricing = Pricing.find_by(user_id: @user.id)
  @pricing.premium = true
  @pricing.save
  render json: {notice: "User was successfully assgined Admin role." }, status: :ok
 end
 
 # UNASSIGN USER
 def unassign_admin
  @user.admin = false
  @user.save
  @pricing = Pricing.find_by(user_id: @user.id)
  @pricing.premium = false
  @pricing.save
  render json: {notice: "User was successfully unassgined Admin role." }, status: :ok
 end
 
 private
 
 def find_user
  @user = User.find_by(id: params[:id])
 end

 # CHECK IF USER IS ADMIN DIRECTOR
 def check_admin_director
  @current_user = User.find_by(username: params[:username])
   if @current_user.admin_director == true && decoded_token[0]["user_id"] == @current_user.id 
   else 
    render json: {error: 'You are not allowed to access this part of the site'}, status: 401
   end
 end
end