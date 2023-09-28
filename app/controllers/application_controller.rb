class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include CurrentCart
  before_action :set_cart

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:notice] = 'Доступ закритий'
    redirect_to(request.referer || root_path)
  end
end
