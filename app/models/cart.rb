class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items

  def add_product_item(product_id) 
    @carrent_item = line_items.find_by(product_id: product_id)

    if @carrent_item
        @carrent_item.quantity += 1
      else 
        @carrent_item = line_items.build(product_id: product_id)
    end

    @carrent_item
  end

  def total_price    
    line_items.to_a.sum { |item| item.total_price }
  end
end
