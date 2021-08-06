class ProfilesController < ApplicationController
  before_action :authorized, only: [:auto_login]
  before_action :set_profile, only: [:show, :update, :destroy]

  # GET /profiles
  def index
      @user = User.find_by(email: params[:email])
      @profile_data = {profile: @user.profile, avatar: url_for(@user.profile.avatar)}
      render json: @profile_data
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)
    # Profile has attached image
    @profile.avatar.attach(params[:avatar])
    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1
  def update
    @user = User.find_by(email: params[:email])
    @profile = Profile.find_by(user_id: @user.id)
    if @profile.update(profile_params)
      @profile_data = {profile: @user.profile, avatar: url_for(@user.profile.avatar)}
      render json: @profile_data
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name)
    end
end
