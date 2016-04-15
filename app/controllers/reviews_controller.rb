class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    if current_user.has_reviewed? @restaurant
      raise "Restaurant already reviewed!"
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      @restaurant.reviews.create(review_params)
      redirect_to restaurants_path
    end
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
