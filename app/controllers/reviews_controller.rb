class ReviewsController < ApplicationController

  def new
    if current_user.has_reviewed? @restaurant
      raise "Restaurant already reviewed!"
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      @review = Review.new
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    @review.update(user_id: current_user.id)
    # if @review.save
      redirect_to restaurants_path
    # else
    #   if @review.errors[:user]
    #     redirect_to restaurants_path, alert: 'You have already reviewed this restaurant'
    #   else
    #     render :new
    #   end
    # end
  end



  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurants_path
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
