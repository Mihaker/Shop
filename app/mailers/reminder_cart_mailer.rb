class ReminderCartMailer < ApplicationMailer

  def reminder(cart)
    @cart = cart
    mail(to: @cart.user.email, subject: 'Нагадування про товари у вашому кошику')
  end
end
