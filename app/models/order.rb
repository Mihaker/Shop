class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  validates :number, presence: true
  validates :address, presence: true
  
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      item.save
      line_items << item
    end
  end
end
