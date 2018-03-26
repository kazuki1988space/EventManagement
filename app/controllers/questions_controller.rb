class QuestionsController < ApplicationController

  def new
    if params[:back]
      @question = Question.new(event_params)
    else
      @question = Question.new
    end
  end

  def confirm
    @question = Question.new(question_params)
    render :new if @question.invalid?
  end

  def create
    @question = Question.new(question_params)
    @question.from_user_id = current_user.id
    @question.to_user_id = @event.user_id
    if @question.save
      EventMailer.event_mail(@event).deliver
      redirect_to events_path
    else
      render "new"
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

  def set_params
    @question = Question.find(params[:id])
  end

end
