class ProfilesController < ApplicationController
  before_action :authorized, only: [:auto_login]
  before_action :set_profile, only: [:show, :update, :destroy]

  # GET /profiles
  def index
      @user = User.find_by(email: params[:email])
      @profile = Profile.where(user_id: @user.id).order("created_at desc").includes(:user)
      render json: @profile
  end

  # # GET /profiles/1
  # def show
  #   render json: @profile
  # end

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

  










  # # PATCH/PUT /profiles/1
  # def update
  #   if @profile.update(profile_params)
  #     render json: @profile
  #   else
  #     render json: @profile.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /profiles/1
  # def destroy
  #   @profile.destroy
  # end

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
