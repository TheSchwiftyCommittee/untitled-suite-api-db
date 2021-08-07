class PricingsController < ApplicationController
  before_action :set_pricing, only: [:show, :update, :destroy]

  # GET /pricings
  def index
    @pricings = Pricing.all

    render json: @pricings
  end

  # GET /pricings/1
  def show
    render json: @pricing
  end

  # POST /pricings
  def create
    @pricing = Pricing.new(pricing_params)

    if @pricing.save
      render json: @pricing, status: :created, location: @pricing
    else
      render json: @pricing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pricings/1
  def update
    if @pricing.update(pricing_params)
      render json: @pricing
    else
      render json: @pricing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pricings/1
  def destroy
    @pricing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pricing
      @pricing = Pricing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pricing_params
      params.require(:pricing).permit(:premium, :profile_id)
    end
end
