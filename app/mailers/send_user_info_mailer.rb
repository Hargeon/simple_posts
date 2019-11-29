class SendUserInfoMailer < ApplicationMailer
  def send_info
    @users = params[:users]
    mail(to: 'andrei.kurhan@coverwallet.com', subject: 'Users info')
  end
end
