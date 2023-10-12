class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  
  def index
    @orders = Order.all
  end  
  
  def show
    @order = Order.find(params[:id])  
  end

  def new
    if @cart.line_items.empty?
      flash[:notice] = 'Ваша корзина пуста'
      redirect_to root_path
      return
    end

    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)


    if @order.save
      Cart.destroy(current_user.cart.id)
      SendOrderMailer.with(order: @order).order_check.deliver_later
      redirect_to root_path
    else
      @cart = current_user.cart
      render :new
    end
  end

  private 

  def order_params
     params.require(:order).permit(:address, :pay_type, :description, :number, :email)
  end


end
