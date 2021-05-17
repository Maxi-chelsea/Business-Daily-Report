Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :employees
  root to: 'homes#top'

  resources :employees, only: [:index, :show, :new, :create, :edit, :update]
  resources :facilities, only: [:new, :create, :index, :show, :edit, :update]
  resources :facility_genres, only: [:index, :create]


  resources :items
  resources :dairy_reports
end
