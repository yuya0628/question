class QuestsController < ApplicationController

  def new
    @quest=Quest.new
  end

  def create
    quest=Quest.new(quest_params)
    quest.user_id = current_user.id
    quest.save
    redirect_to root_path
  end

  # def make_solved
    # @quest=Quest.find(params[:id])
    # @quest.is_solved = true
    # redirect_to root_path
  # end

  def index
    @quests=Quest.all
  end

  # def index_t
    # @quests=Quest.all  find_byメソッド
        #  if @quests.is_solved == true
      
    # end
  # end

  def show
  end

  def destroy
  end

  private

   def quest_params
    params.require(:quest).permit(:title,:content)
   end

end
