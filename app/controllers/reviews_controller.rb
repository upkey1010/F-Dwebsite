class ReviewsController < ApplicationController
  before_action :set_food
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
      @categories = Category.all
    @reviews = Review.all
  end


  def show
  end


  def new
    @review = Review.new
      @categories = Category.all
  end

  def edit
  end


  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.food_id = @food.id
    if @review.save
      redirect_to @food
    else
      render 'new'
    end
  end


  def update
      @categories = Category.all
    if @review.update(review_params)
  end


  def destroy
    @review.destroy
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def set_food
      @food = Food.find(params[:food_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
