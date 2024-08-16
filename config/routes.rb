Rails.application.routes.draw do
  get "sentence_pairs/index"
  get "sentence_pairs/new"
  get "sentence_pairs/create"
  get "sentence_pairs/show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root "sentence_pairs#index"
  get "sentence_pairs/list", to: "sentence_pairs#list", as: "sentence_pair_list"

  resources :sentence_pairs, except: [:index] do
    member do 
      post 'check_answer'
      get 'result'
    end
  end
end
