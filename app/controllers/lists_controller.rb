class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]
  before_action :find_user
  
  # GET /lists
  def index
    if decoded_token[0]["user_id"] == @user.id 
      @lists = @user.lists
      render json: @lists
    else
      render json: {error: "You do not have access to other user's lists."}, status: :unauthorized
    end
end

  # GET /lists/1
  def show
    if decoded_token[0]["user_id"] == @user.id && @list.user_id == @user.id
      render json: @list
    else
      render json: {error: "You do not have access to other user's lists."}, status: :unauthorized
    end 
  end
  
  # POST /lists
  def create
    if decoded_token[0]["user_id"] == @user.id 
      if @user.pricing.premium == false && @user.lists.length <= 4 || @user.pricing.premium == true && @user.lists.length <= 4 
        @list = List.new(list_params)
        @list.user_id = decoded_token[0]["user_id"]
        @list.save
        render json: @list, status: :created, location: @list
      else 
        render json: {error: "You have excceeded your List limit"}, status: :unauthorized
      end
    else
      render json: {error: "You do not have permission to create lists"}, status: :unauthorized
    end
  end

  # PATCH/PUT /lists/1
  def update
    if decoded_token[0]["user_id"] == @user.id && @list.user_id == @user.id
      @list.update(list_params)
      if @list.update(list_params)
        render json: {notice: "List was successfully updated." }, status: :ok
      else
        render json: {error: "You do not have permission to update other user's lists."}, status: :unauthorized
      end
    else 
      render json: {error: "You do not have access to update other user's lists."}, status: :unauthorized
    end
  end

  # DELETE /lists/1
  def destroy
    if decoded_token[0]["user_id"] == @user.id && @list.user_id == @user.id
      @list.destroy
      if @list.destroy
        render json: {notice: 'List was successfully deleted.'}, status: :ok
      else
        render json: {error: "You do not have permission to destroy other user's lists."}, status: :unauthorized
      end
    else 
      render json: {error: "You do not have access to destroy other user's lists."}, status: :unauthorized
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.permit(:title)
  end

  def find_user
    @user = User.find_by(username: params[:username])
  end
end
  