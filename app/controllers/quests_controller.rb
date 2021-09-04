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

   def edit
    @quest=Quest.find(params[:id])
   end

   def update
    @quest=Quest.find(params[:id])
    @quest.is_solved=true
    @quest.update(quest_params)
    redirect_to root_path
   end

   def make_solved
     @quest = Quest.find(params[:id])
     @quest.update(is_solved: true)
     redirect_to root_path
   end

  def index
    @quests=Quest.all
  end

  def index_t
    @quests=Quest.where(is_solved:true)
  end

  def index_f
    @quests=Quest.where(is_solved:false)
  end

  # def index_t
    # @quests=Quest.all  find_byメソッド
        #  if @quests.is_solved == true
      
    # end
  # end

  def show
    @quest=Quest.find(params[:id])
  end

  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy
    redirect_to root_path
  end

  private

   def quest_params
    params.require(:quest).permit(:title,:content,:is_solved)
   end

end
