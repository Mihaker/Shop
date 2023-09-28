class User < ApplicationRecord  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          
  has_one :cart

  enum role: {seller: 2, buyer: 1, admin: 0}, _suffix: :role

  def assign_customer_id
    customer = Stripe::Customer.create(email: current_user.email)
    self.customer_id = customer.id
  end
end
