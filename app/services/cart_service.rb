module CartService  
  def self.notify
    @carts = Cart.joins(:line_items).group('carts.id').having('COUNT(line_items.id) > 1')

    @carts.each do |cart|
      ReminderCartMailer.with(cart: cart).reminder(cart).deliver_now
    end
  end
end