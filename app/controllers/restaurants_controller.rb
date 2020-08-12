class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    redirect_to restaurants_path
  end

  def create
      @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new
      end

      # no need for app/views/restaurants/create.html.erb

  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to restaurant_path(restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :reviews, :category)
  end
end
