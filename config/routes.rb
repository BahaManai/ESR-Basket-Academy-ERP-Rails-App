Rails.application.routes.draw do
  resources :products, except: [ :show ]
  devise_for :users, skip: :registrations
  resources :users, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]

  resources :groupes, except: [ :show ]
  get "achat/index"
  get "assurance/index"
  get "paiement/index"
  get "salaire/index"
  get "/forgot_password", to: "devise/passwords#edit", as: "forgot_password"

  get "salaires", to: "salaire#index", as: "salaires"
  delete "salaires/:id", to: "salaire#destroy", as: "salaire"
  get "/salaires/new", to: "salaire#new", as: "new_salaire"
  post "/salaires", to: "salaire#create"

  get "paiements", to: "paiement#index", as: "paiements"
  delete "paiements/:id", to: "paiement#destroy", as: "paiement"
  get "/paiements/new", to: "paiement#new", as: "new_paiement"
  post "/paiements", to: "paiement#create"
  patch "paiements/:id", to: "paiement#update", as: "update_paiement"
  get "paiements/:id/edit", to: "paiement#edit", as: "edit_paiement"
  get "paiements/export_csv", to: "paiement#export_csv", as: "export_csv_paiements"

  get "assurances", to: "assurance#index", as: "assurances"
  delete "assurances/:id", to: "assurance#destroy", as: "assurance"
  get "/assurances/new", to: "assurance#new", as: "new_assurance"
  post "/assurances", to: "assurance#create"
  patch "assurances/:id", to: "assurance#update", as: "update_assurance"
  get "assurances/:id/edit", to: "assurance#edit", as: "edit_assurance"
  get "assurances/export_csv", to: "assurance#export_csv", as: "export_csv_assurances"

  get "achats", to: "achat#index", as: "achats"
  delete "achats/:id", to: "achat#destroy", as: "achat"
  get "/achats/new", to: "achat#new", as: "new_achat"
  post "/achats", to: "achat#create"
  patch "achats/:id", to: "achat#update", as: "update_achat"
  get "achats/:id/edit", to: "achat#edit", as: "edit_achat"
  get "achats/export_csv", to: "achat#export_csv", as: "export_csv_achats"


  resources :saisons, except: [ :show ]
  resources :parents, except: [ :show ]
  resources :depenses, except: [ :show ]
  get "dashbord/index"
  resources :entraineurs, except: [ :show ]
  resources :joueurs, except: [ :show ] do
    collection do
      get :export_csv
    end
  end
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
