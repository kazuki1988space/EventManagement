class EventsController < ApplicationController

  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only:[:new, :edit, :show]

  def index
    @search = Event.search(params[:q])
    @events = @search.result.page(params[:page]).per(3)
  end

  def new
    if params[:back]
      @event = Event.new(event_params)
    else
      @event = Event.new
    end
  end

  def confirm
    @event = Event.new(event_params)
    @event.date = Time.zone.local(params["event"]["date(1i)"].to_i, params["event"]["date(2i)"].to_i, params["event"]["date(3i)"].to_i, params["event"]["date(4i)"].to_i, params["event"]["date(5i)"].to_i)
    @event.user_id = current_user.id
    render "new" if @event.invalid?
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.image.retrieve_from_cache! params[:cache][:image]
    if @event.save
      EventMailer.event_mail(@event).deliver
      redirect_to events_path, notice: "イベントを投稿しました"
    else
      render "new"
    end
  end

  def show
    @participant = current_user.participants.find_by(event_id: @event.id)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "イベントを編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "イベントを削除しました"
  end

  private
  def event_params
    params.require(:event).permit(:category, :title, :content, :image, :area, :place, :date, :payment, :maxpeople, :image_cache, :cache)
  end

  def set_params
    @event = Event.find(params[:id])
  end

  def logged_in?
    if current_user.nil?
      flash[:danger] = "ログインして下さい"
      redirect_to new_session_path
    end
  end

end
