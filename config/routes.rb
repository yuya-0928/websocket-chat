Rails.application.routes.draw do
  devise_for :admins, controllers:{
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :talents, controllers:{
    sessions: 'talents/sessions',
    passwords: 'talents/passwords',
    registrations: 'talents/registrations'
  }
  root to: 'rooms#index'

  resources :rooms, only: [:create, :show]
  
  namespace :talents do
    resources :talent, only: [:show, :edit, :update]
  end

end
