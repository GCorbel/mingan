Rails.application.routes.draw do
  root to: "sightings#index"
  resources :sightings
  resources :regions
end
