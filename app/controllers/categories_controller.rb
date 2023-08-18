class CategoriesController < ApplicationController

  def new 
    @category = Category.new
  end 
  
  def show 
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save 
      redirect_to root_path
      flash[:success] = 'Категорія створено'
    else
      render :new
    end
  end

  def destroy
      @category.destroy
      flash[:error] = 'Видалено категорію'
      redirect_to root_path
  end


  private 

  def category_params
    params.require(:category).permit(:name)
  end
end
