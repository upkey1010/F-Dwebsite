class StaticPagesController < ApplicationController
  def home
  	@foods = Food.all
  	@categories = Category.all
  end

  def about
  	  @categories = Category.all
  end

  def help
  	  @categories = Category.all
  end

end
