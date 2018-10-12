Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'
  resources :projects, only: [:create, :show, :edit, :update] do
    resources :records, only: [:create, :new]
  end
end
