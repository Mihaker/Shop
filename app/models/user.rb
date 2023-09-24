class User < ApplicationRecord  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          
  has_one :cart


  after_save :assign_customer_id 
    def assign_customer_id
      if self.customer_id.blank? 
        customer = Stripe::Customer.create(email: current_user.email)
        self.update(customer_id: customer.id)
      end
    end
end
