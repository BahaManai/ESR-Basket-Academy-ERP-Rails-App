Rails.application.routes.draw do
  get "groupe/index"
  get "achat/index"
  get "assurance/index"
  get "paiement/index"

  get "salaires", to: "salaire#index", as: "salaires"
  delete "salaires/:id", to: "salaire#destroy", as: "salaire"
  get "/salaires/new", to: "salaire#new", as: "new_salaire"
  post "/salaires", to: "salaire#create"

  get "paiements", to: "paiement#index", as: "paiements"
  delete "paiements/:id", to: "paiement#destroy", as: "paiement"
  get "/paiements/new", to: "paiement#new", as: "new_paiement"
  post "/paiements", to: "paiement#create"
  patch "paiements/:id", to: "paiement#update", as: "update_paiement"

  get "assurances", to: "assurance#index", as: "assurances"
  delete "assurances/:id", to: "assurance#destroy", as: "assurance"
  get "/assurances/new", to: "assurance#new", as: "new_assurance"
  post "/assurances", to: "assurance#create"
  patch "assurances/:id", to: "assurance#update", as: "update_assurance"

  get "achats", to: "achat#index", as: "achats"
  delete "achats/:id", to: "achat#destroy", as: "achat"
  get "/achats/new", to: "achat#new", as: "new_achat"
  post "/achats", to: "achat#create"
  patch "achats/:id", to: "achat#update", as: "update_achat"

  resources :saisons
  resources :users
  resources :parents
  resources :depenses
  get "dashbord/index"
  resources :entraineurs
  resources :joueurs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root to: "dashbord#index"
end
