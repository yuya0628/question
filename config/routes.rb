Rails.application.routes.draw do
  root 'quests#index'
  # get 'quests/:id/make_solved',to:'quests#make_solved'
  get 'quests/index_t',to:'quests#index_t'
  get 'quests/index_f',to:'quests#index_f'
  # patch 'quests/:id/make_solved' => 'quests#make_solved'
  devise_for :users

  resources(:users,{only:[:show,:index,:edit,:update,:destroy]})

  resources(:quests,{only:[:new,:create,:show,:destroy,:edit,:update]}) do 
    member do
      get 'make_solved'
    end

    collection do
      get 'search'
    end

    resources(:quest_answers,{only:[:create,:destroy]})
  end 

  resources(:users,{only:[:index,:show,:edit,:update]})
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
