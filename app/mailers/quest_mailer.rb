class QuestMailer < ApplicationMailer

  def creation_email
    @user=params[:user]
    @quest=params[:quest]
    mail(
      subject:'質問投稿メール',
      to:'@user.email',
      from:'questleaf@example.com'
    )
  end 

end
