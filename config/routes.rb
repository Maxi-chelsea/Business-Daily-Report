Rails.application.routes.draw do
  get 'daily_report_comments/create'
  get 'daily_report_comments/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :employees
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :employees do
    collection do
      get 'search'
    end

    resources :messages, only: [:index, :create, :destroy]
      member do
        get :followings
        get :followers
        get :favorites
      end
  end

  resources :events


  scope module: :facility do
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :item_comments, only: [:create, :destroy]
    end
  end

  resources :facilities, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  scope module: :daily_report do
    resources :daily_reports, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :daily_report_comments, only: [:create, :destroy]
    end
  end

  resources :notifications, only: :index


end