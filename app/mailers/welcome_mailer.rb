class WelcomeMailer < ApplicationMailer
  default from: 'testmailer489@gmail.com'

  def welcome_email(user)
    mail(to: user.user_auth.email, subject: 'Welcome to eLearning!')
  end
end
