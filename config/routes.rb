Rails.application.routes.draw do

  get 'assigments/new'
  get 'assigments/create'
  get 'assigments/edit'
  get 'assigments/index'
  get 'assigments/update'
  get 'assigments/destroy'
  # get 'subjects/new'
  # get 'subjects/create'
  devise_for :users
  root to: 'pages#home'

  # resources :users do
  #   # resources :locations
  #   # resources :tags

  # end

  resources :contacts do
    resources :milestones
  end
  resources :locations
  resources :subjects
  resources :tags


  # resources :users do
  #   resources :locations, only: [:index, :show, :new, :create, :edit, :update]
  # end

  # resources :users do
  #   resources :tags, only: [:index, :show, :new, :create, :edit, :update]
  # end

  # resources :contacts do
  #   resources :milestones
  # end

  # resources :milestones do
  #   resources :locations, except: :destroy
  # end
 # require "sidekiq/web"
 #  authenticate :user, lambda { |u| u.admin } do
 #    mount Sidekiq::Web => '/sidekiq'
 #  end

end
