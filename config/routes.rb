Rails.application.routes.draw do
  root to: "sightings#index"
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
  resources :animals
end
