class CategoryPolicy < ApplicationPolicy
  def create? 
    current_user.admin_role?
  end
 
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
