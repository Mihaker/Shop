class CheckoutController < ApplicationController

  def create 
    @order = Order.find(params[:id])
    @customer = Stripe::Customer.create(
      email: current_user.email
    )

    session = Stripe::Checkout::Session.create(
      customer: @customer, 
      payment_method_types: ['card'],
      line_items: @order.line_items.collect {|item| item.product.to_builder.attributes!},
      mode: 'payment',
      success_url:  checkout_success_url,
      cancel_url: checkout_cancel_url
     )
     redirect_to session.url, allow_other_host: true
  end 

  def success
    #handle successful payments
    redirect_to root_url, notice: "Purchase Successful"
  end

    def cancel
    #handle if the payment is cancelled
    redirect_to root_url, notice: "Purchase Unsuccessful"
  end
end
