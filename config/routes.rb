Rails.application.routes.draw do
  resources :players, only: %i[index show] do
    member do
      post :complete_mark
      get :check_mark_completion
    end
  end

  resources :teams, only: %i[index show]
  resources :games, only: %i[index show]
  resources :achievements, only: %i[index show]

  resources :marks, only: %i[index show] do
    get :top, on: :member
  end
end
