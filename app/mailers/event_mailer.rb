class EventMailer < ApplicationMailer

  def event_mail(event)
    @event = event

    mail to: @event.user.email, subject: "イベント新規作成完了"
  end

end
