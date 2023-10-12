class SendOrderMailer < ApplicationMailer

  def order_check
    @order = params[:order]
    mail(to: @order.email, subject: "Замовлення підтвредженно")
  end

end