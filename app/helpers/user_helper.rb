module UserHelper
  def user_roles
    User.roles.to_a.map do |role|
      [role[0].titleize, role[0]]
    end
  end
end