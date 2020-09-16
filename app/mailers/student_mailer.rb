class StudentMailer < ApplicationMailer
  default from: 'testmailer489@gmail.com'

  def purchase_email(user, compiled)
    @compiled = compiled
    mail(to: user.email, subject: 'Purchase Confirmation')
  end
end
