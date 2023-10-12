class SendEmailMailer < ApplicationMailer
  
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Вашу роль було оновлено')
  end

end
