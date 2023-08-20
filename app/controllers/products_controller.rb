class ProductsController < ApplicationController
  
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end
  

  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to root_path 
    else
      flash[:error] = 'Сталася помилка'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])    
  end

  def update
    @product = Product.find(params[:id])  
    if @product.update(product_params)
      redirect_to products_path
    else
      render :new  
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:info] = 'Публікацію виделано'
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :category_id)
  end
end
