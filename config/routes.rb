Rails.application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                      controllers: {omniauth_callbacks: "omniauth_callbacks", :registrations => "registrations"}

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  root :to => "application#home"

  resources :documents do
  end

  #get 'sign_up', to: 'users#new', :as => "sign_up"
  #resources :sessions

  #match "log_in", :to => 'sessions#new', as: "sign_in"
  #match '/auth/:provider/callback', :to => 'sessions#create', via: 'get'

  #match 'auth/failure', to: redirect('/'), via: 'get#'

  #match 'signout', to: 'sessions#destroy', as: 'signout', via: 'get'

  resources :users, only: :show do
    get "about", to: 'users#about', :as => "about"
    get "videos", to: 'users#videos', :as => "videos"
  end

  #resources :channels, :path => "channel" do
   # get "videos", to: 'medias#show', :as => "videos"
  #end

  match "channel/:id", :to => 'users#show', as: "channel", via: 'get'

  resources :medias
  resources :media_steps

  get "playlists_management", :to => "playlists_management#show", as: "playlists_management", via: 'get'

  resources :playlists
  resources :category_of_playlists_channels

  resources :events

  match "create_bin", controller: "events", via: ['get','post']
  match "modify_bin", controller: "events", via: ['get','post']

  resources :labels

  resources :bins, only: [:destroy]

  get "channel", controller: "application"

  get "category_plist_channels_api", controller: "users", :only => [:show], :defaults => { :format => 'json' }
end
