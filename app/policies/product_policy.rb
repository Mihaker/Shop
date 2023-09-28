class ProductPolicy < ApplicationPolicy
  def crate?
    current_user.admin_role?
  end

  def update?
    current_user.admin_role? 
  end

  def destroy?
    current_user.admin_role?
  end
  
  class Scope < Scope
  end
end
