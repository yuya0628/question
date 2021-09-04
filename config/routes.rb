Rails.application.routes.draw do
  root 'quests#index'
  devise_for :users
  resources(:quests,{only:[:new,:create,:show,:destroy]})
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
