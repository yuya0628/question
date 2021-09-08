class QuestAnswerMailer < ApplicationMailer
  def creation_email
    @quest=params[:quest]
    @quest_answer=params[:quest_answer]
    mail(
      subject:'回答メール',
      to: [@quest.user.email,@quest_answer.user.email],
      from:'questleaf@example.com'
    )
  end
end
