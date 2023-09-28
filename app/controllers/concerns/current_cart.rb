module CurrentCart  
  extend ActiveSupport::Concern

  
  private  

  def set_cart  
    @cart = Cart.find_or_create_by(user: current_user)    
  end
end