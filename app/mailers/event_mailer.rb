class EventMailer < ApplicationMailer

  def event_mail(event)
    @event = event

    mail to: @event.user.email, subject: "お問い合わせしました"
  end

end
