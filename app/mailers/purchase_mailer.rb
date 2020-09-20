class PurchaseMailer < ApplicationMailer
  default from: 'testmailer489@gmail.com'

  def otp_email(user, password)
    @password = password
    mail(to: user.email, subject: 'Purchase One-Time Password')
  end

  def purchase_email(user, compiled)
    @compiled = compiled
    mail(to: user.email, subject: 'Purchase Confirmation')
  end

  def enrollment_email(teacher, student, section)
    @student = student
    @section = section
    mail(to: teacher.user_auth.email, subject: 'Course Enrollment Update')
  end
end
