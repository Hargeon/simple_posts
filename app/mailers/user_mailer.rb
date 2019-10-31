class UserMailer < ApplicationMailer
  def registration_letter
    @user = params[:user]
    mail(to: @user.email, subject: 'Thanks for registration')
  end
end
