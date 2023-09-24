class Product < ApplicationRecord
  belongs_to :category 
  has_many :line_items

  
  after_create do 
    product = Stripe::Product.create(name: name)
    price = Stripe::Price.create(product: product, unit_amount: self.price, currency: 'USD')
    update(stripe_product_id: product.id, stripe_price_id: price.id)
  end
  
  def to_builder
    Jbuilder.new do |product|
      product.price stripe_price_id   
      product.quantity 1 
    end
  end


  private

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "image_url", "name", "price", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
