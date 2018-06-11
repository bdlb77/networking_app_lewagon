Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, shallow: true do
    resources :contacts
    resources :tags, except: :destroy
    resources :locations, except: :destroy
  end

  # resources :users do
  #   resources :locations, only: [:index, :show, :new, :create, :edit, :update]
  # end

  # resources :users do
  #   resources :tags, only: [:index, :show, :new, :create, :edit, :update]
  # end

  resources :contacts do
    resources :milestones
  end

  resources :milestones do
    resources :locations, except: :destroy
  end

  
end
