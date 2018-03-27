class NewUserMailer < ApplicationMailer

  def new_user_mail(user)
   @user = user

   mail to: @user.email, subject: "新規登録完了"
  end

end
