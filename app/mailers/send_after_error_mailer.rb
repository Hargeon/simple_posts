class SendAfterErrorMailer < ApplicationMailer
  def death_user
    mail(to: 'andrei.kurhan@coverwallet.com', subject: 'User has died')
  end
end
