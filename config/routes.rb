Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :employees
  root to: 'homes#top'

  resources :employees, only: [:index, :show, :new, :create, :edit, :update]
  scope :facility do
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end

  resources :facilities, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :dairy_reports
end
