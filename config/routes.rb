Rails.application.routes.draw do
  resources :questions, only: [:index, :show, :new, :create] do
  	resource :qvote, only: [:create, :destroy]
  	resources :qcomments, only: [:create]
    resources :comments, module: :questions, only: [:create]
  end
  
  resources :answers, only: [:create] do
  	resource :avote, only: [:create, :destroy]
  	resources :acomments, only: [:create]
    resources :comments, module: :answers, only: [:create]
  end

  devise_for :users
  
  root to: 'questions#index'

end
