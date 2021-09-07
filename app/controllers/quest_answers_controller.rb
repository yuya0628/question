class QuestAnswersController < ApplicationController

  def create
    quest_answer=QuestAnswer.new(quest_answer_params)
    @quest=Quest.find(params[:quest_id])
    quest_answer.quest_id=@quest.id
    quest_answer.user_id=current_user.id
    quest_answer.save
    redirect_to quest_path(@quest)
  end

  def destroy
    QuestAnswer.find_by(id:params[:id],quest_id:params[:quest_id]).destroy
    redirect_to quest_path(params[:quest_id])
  end

  private

  def quest_answer_params
    params.require(:quest_answer).permit(:answer)
  end
end
