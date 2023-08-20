class ShopsController < ApplicationController
 
  def index
      @q = Product.ransack(params[:q])
      @products = @q.result(distinct: true)
      @categories = Category.all
   end
   

   def show 
      @post = Product.find(params[:id])
   end
end
