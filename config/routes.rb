Rails.application.routes.draw do

  # get 'subjects/new'
  # get 'subjects/create'
  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :contacts do
      resources :milestones
      end
    end
  end

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

  # resources :milestones, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
  #   resources :locations, only: [:index, :show, :new, :create, :edit, :update]
  # end
  # get 'tags/index'
  # get 'tags/new'
  # get 'tags/show'
  # get 'tags/create'
  # get 'tags/edit'
  # get 'tags/update'
  # get 'locations/index'
  # get 'locations/new'
  # get 'locations/show'
  # get 'locations/create'
  # get 'locations/edit'
  # get 'locations/update'
  # get 'milestones/index'
  # get 'milestones/new'
  # get 'milestones/show'
  # get 'milestones/create'
  # get 'milestones/edit'
  # get 'milestones/update'
  # get 'milestones/destroy'
  # get 'contacts/index'
  # get 'contacts/new'
  # get 'contacts/show'
  # get 'contacts/create'
  # get 'contacts/edit'
  # get 'contacts/update'
  # get 'contacts/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
