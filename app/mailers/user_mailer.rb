class UserMailer < ActionMailer::Base
  default from: 'no-reply@goaltracker.com'

  def confirm_email(user)
    @user = user
    @confirmation_link = root_url

    mail(
      to: user.email,
      bcc: 'signups@goaltracker.com',
      subject: 'Confirmação de e-mail'
      )
  end

  def alarm_goal(user)
    mail(
      to: user.email,
      bcc: 'signups@goaltracker.com',
      subject: 'Objetivo de hoje ainda não foi preenchido'
    )
  end
end
