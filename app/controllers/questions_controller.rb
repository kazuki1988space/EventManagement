class QuestionsController < ApplicationController

  def new
    if params[:back]
      @question = Question.new(question_params)
    else
      @question = Question.new(to_user_id: params[:event][:user_id])
    end
  end

  def confirm
    @question = Question.new(question_params)
    render :new if @question.invalid?
  end

  def create
    @question = Question.new(question_params)
    @question.from_user_id = current_user.id
    @name = User.find_by(id: @question.to_user_id).name
    if @question.save
      QuestionMailer.question_mail(@question).deliver
      redirect_to events_path, notice: "主催者の#{@name}さんへお問い合わせしました"
    else
      render "new"
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content, :to_user_id)
  end

  def set_params
    @question = Question.find(params[:id])
  end

end
