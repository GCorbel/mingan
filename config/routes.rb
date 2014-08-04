Rails.application.routes.draw do
  root to: "sightings#index"
  resources :sightings
  resources :regions
  resources :sea_states
  resources :cloud_covers
  resources :vessels
  resources :modes
end
