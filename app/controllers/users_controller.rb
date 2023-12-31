class UsersController < ApplicationController
  def index 
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update user_params
      SendEmailMailer.with(user: @user).welcome_email.deliver_later
      redirect_to users_path, notice: "Роль пользователя обновлена успешно."     
    else 
      render :edit
    end
  end

  def destroy 
  end 

  private 
   
  def user_params
    params.require(:user).permit(:role)
  end
end