module Authorization
  extend  ActiveSupport::Concern 

  include do 
    include Pundit 
  end 
  private
end 