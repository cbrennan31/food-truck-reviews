class Api::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    review = Review.new(review_params)
    review.user = current_user

    if review.save
      render_reviews(review.truck)
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    truck = Truck.find(params[:truck_id])
    render_reviews(truck)
  end

  private
  def review_params()
    params.require(:review).permit(:truck_id, :rating, :description)
  end

  def render_reviews(truck)
    render json: { reviews: truck.reviews.order(created_at: :desc) }
  end
end