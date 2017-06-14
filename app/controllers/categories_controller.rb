class CategoriesController < ApplicationController
  before_action :logged_in_user

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
    		flash[:success] = "Adding successful"
    		redirect_to root_path
   	    else
      		render 'new'
      	end

    end

    def show
      @categories = Category.all
    	@category_id = Category.find(params[:id]) 
      @category= Category.where(id: @category_id)
      @foods = Food.where(category_id: @category_id).order("created_at DESC")
    end

    def index
    	@categories = Category.paginate(page: params[:page])
 	end

 	def edit
    @categories = Category.all
    	@category = Category.find(params[:id])
  	end

  	def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated"
      redirect_to root_path
    else
      render 'edit'
    end
  	end

 	def destroy
	    Category.find(params[:id]).destroy
	    flash[:success] = "Category deleted"
	    redirect_to root_path
  	end
	private

	def category_params
      params.require(:category).permit(:name)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
