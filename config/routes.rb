Rails.application.routes.draw do
  get 'static_pages/index'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  root to: 'static_pages#index'
  resources :users, only: [:new, :create] do
    resources :todos, only: [:new, :index, :update, :create, :destroy, :edit]
  end
  root to: "todos#index"
end
