class QuestionMailer < ApplicationMailer

  def question_mail(question)
   @question = question


   mail to: User.find_by(id: @question.to_user_id).email, subject: "お問合せメール"
  end

end
