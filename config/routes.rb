Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :employees
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :employees, only: [:index, :show, :new, :create, :edit, :update]

  scope module: :facility do
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :item_comments, only: [:create, :destroy]
    end
  end

  resources :facilities, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :dairy_reports, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :dairy_report_comments, only: [:create, :destroy]
  end
end
