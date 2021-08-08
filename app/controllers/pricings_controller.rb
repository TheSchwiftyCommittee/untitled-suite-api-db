class PricingsController < ApplicationController
  
    # POST /pricings
  def create
    @pricing = Pricing.new(pricing_params)

    if @pricing.save
      render json: @pricing, status: :created, location: @pricing
    else
      render json: @pricing.errors, status: :unprocessable_entity
    end
  end

  # def new
  #   @user = User.find_by(id: params[:id])
  #   if decoded_token[0]["user_id"] == @user.id && @user.pricing.premium == true
  #     redirect_to root_path, notice: "You are alaready a subscriber"
  # end

  # def create
  #   @user = User.find_by(email: params[:email])
  #   Stripe.api_key = Rails.application.credentials.stripe_api_key

  #   plan_id = params[:plan_id]
  #   plan = Stripe::Plan.retrieve(plan_id)
  #   token = params[:stripeToken]

  #   customer = if @user.stripe_id?
  #               Stripe::Customer.retrieve(@user.stripe_id)
  #              else
  #               Stripe::Customer.create(email: @user.email, source: token)
  #             end

  #   subscription = customer.subscriptions.create(plan: plan.id)

  #   options = {
  #     stripe_id: customer.id,
  #     stripe_subscription_id: subscription.id,
  #     subscribed: true
  #   }

  #   options.merge!(
  #     card_last4: params[:user][:card_last4],
  #     card_exp_month: params[:user][:card_exp_month],
  #     card_exp_year: params[:user][:card_exp_year],
  #     card_type: params[:user][:card_type]
  #   ) if params[:user][:card_last4]
  #   current_user.update(options)
  #   redirect_to root_path, notice: "Your subscription was setup successfully!"
  # end

  # def destroy
  #   @user = User.find_by(email: params[:email])
  #   customer = Stripe::Customer.retrieve(@user.stripe_id)
  #   customer.subscriptions.retrieve(@user.stripe_subscription_id).delete
  #   current_user.update(stripe_subscription_id: nil)
  #   current_user.subscribed = false
  #   redirect_to root_path, notice: "Your subscription has been cancelled."
  # end

end
  
