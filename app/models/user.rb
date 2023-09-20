class User < ApplicationRecord  
  has_one :cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



         def assign_customer_id
          customer = Stripe::Customer.create(email: current_user.email)
          self.customer_id = customer.id
        end
end
