Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'visitors#index', as: :authenticated_root
    end
    root to: "devise/sessions#new"
  end

  resources :sightings do
    resources :blows
    resources :biopsies
    resources :feces
    resources :animal_sightings
  end
  resources :regions
  resources :sea_states
  resources :cloud_covers
  resources :vessels
  resources :modes
  resources :species
  resources :animals
end
