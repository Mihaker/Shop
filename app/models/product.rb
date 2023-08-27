class Product < ApplicationRecord
  belongs_to :category 
  has_many :line_items
  
  private

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "image_url", "name", "price", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
