class FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
    @reviews = Review.where(food_id: @food.id).order("created_at DESC")
 @categories = Category.all
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def index
    
 @categories = Category.all
    if params[:type].nil?
      @foods = Food.all
    else
      @foods = Food.send(params[:type])
    end

  end

  def edit
    @food = Food.find(params[:id])
     @categories = Category.all
  end

  def update
    @food = Food.find(params[:id])
    if @food.update_attributes(food_params)
      flash[:success] = "Food updated"
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def create
    @food = Food.new(food_params)
    if @food.save
    	flash[:success] = "Adding successful"
    	redirect_to @food
    else
      render 'new'
    end
  end

    def destroy
    Food.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to '/foods'
  end

  private 

  def food_params
      params.require(:food).permit(:name, :price, :url, :category_id)
    end


end
