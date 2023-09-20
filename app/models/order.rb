class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  validates :number, presence: true
  validates :address, presence: true
  
  CHECKOUT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      item.save
      line_items << item
    end
  end

 
  def to_builder
    Jbuilder.new do |product|
      product.name
    end
  end

  def stripe_line
    line_items.map do |item|
    {
     :name => item.product.name
    }
    end
  end

  def total_price    
    line_items.to_a.sum { |item| item.total_price }
  end
end
