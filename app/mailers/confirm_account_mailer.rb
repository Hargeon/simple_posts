class ConfirmAccountMailer < ApplicationMailer
  def confirm
    mail(to: 'hirami14590@gmail.com', subject: 'Confirmation')
  end
end
