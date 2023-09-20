class CheckoutController < ApplicationController

  def create 
    order = Order.find(params[:id])
    @customer = Stripe::Customer.create(
      email: current_user.email
    )

    session = Stripe::Checkout::Session.create( 
      customer: @customer, 
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'USD',
          unit_amount: 3,
          product_data: {
            name: order.stripe_line,
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url:  checkout_success_url,
      cancel_url: checkout_cancel_url
     )
     redirect_to order 
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
