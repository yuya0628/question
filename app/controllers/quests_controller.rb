class QuestsController < ApplicationController

  before_action(:authenticate_user!,only:[:new,:create])  #ログインしてる人だけ質問投稿ページに飛べる

   before_action :set_q, only: [:index, :search] #検索機能

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

  def show
    @quest=Quest.find(params[:id])
  end

  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy
    redirect_to root_path
  end

  def search
    @results = @q.result
  end


  private

  def set_q
    @q = Quest.ransack(params[:q])
  end
  
  
  def quest_params
   params.require(:quest).permit(:title,:content,:is_solved)
  end

end
