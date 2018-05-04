Rails.application.routes.draw do
  root 'rooms#index'
  devise_for :users
  resources :rooms, param: :key
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
