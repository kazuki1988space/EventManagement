class ParticipantsController < ApplicationController

  def create
    participant = current_user.participants.create(event_id: params[:event_id])
    redirect_to events_path,
    notice: "#{participant.event.user.name}さんのイベントの参加を受け付けました"
  end

  def destroy
    participant = current_user.participants.find_by(event_id: params[:event_id]).destroy
    redirect_to event_path(participant.event.id),
    notice: "#{participant.event.user.name}さんのイベントの参加をキャンセルしました"
  end

  def show

  end

end
