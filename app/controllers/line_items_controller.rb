class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]


  
  def create
    @product = Product.find(params[:product_id])
    
    @line_item = @cart.add_product_item(@product.id)

    if @line_item.save
      flash[:notice] = 'в корзині'
      redirect_to root_path
    else
      flash[:error] = 'сталася помилка'
      redirect_to root_path
    end
  end
end
