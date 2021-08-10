class ProfilesController < ApplicationController
  # before_action :authorized, only: [:auto_login]
  before_action :decoded_token, only: [:index, :update]
  before_action :set_profile, only: [:update]

  # GET /profiles
  def index
    @user = User.find_by(email: params[:email])
    if decoded_token[0]["user_id"] == @user.id
      @profile_data = {profile: @user.profile, avatar: url_for(@user.profile.avatar)}
      render json: @profile_data
    else
      render json: {error: "You are not authorised to access this"}, status: :unauthorized
    end
  end

  # POST /profiles
  def create
    @user = User.find_by(id: params[:id])
    if decoded_token[0]["user_id"] == @user.id && @user.profile == nil
      @profile = Profile.new(profile_params)
      @profile.user_id = decoded_token[0]["user_id"]
      #  Profile has attached image
      @profile.avatar.attach(params[:avatar])
      @profile.save
      if @profile.save
        render json: @profile, status: :created, location: @profile
      else
        render json: @profile.errors, status: :unprocessable_entity
      end
    else 
      render json: {error: "You are not allowed to create more than 1 profile or create a profile for another account."}, status: :unauthorized
    end
  end

  # PATCH/PUT/profiles/1
  def update
    @user = User.find_by(id: params[:id])
    if decoded_token[0]["user_id"] == @user.id
      @profile = Profile.find_by(user_id: @user.id)
      if @profile.update(profile_params)
        @profile_data = {profile: @user.profile, avatar: url_for(@user.profile.avatar)}
        render json: @profile_data
      else
        render json: @profile.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "You are not authorised to edit this"}, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.permit(:first_name, :last_name, :avatar)
    end
end
