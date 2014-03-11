Downhill::Application.routes.draw do
  
  match '/users/auth/:action/callback' => 'omniauth_callbacks#authorize_stripe', via: [:get, :post]

  devise_for :users
  devise_for :participants, :controllers => { :registrations => "participants" }


  resources :settings
  resources :users
  resources :participants


  get '/:event_id/fee' => "fee#index", :as => "fees"
  post '/fee/:event_id' => "fee#create", :as => "/"
  get '/fee/new' => "fee#new", :as => "new_fee"
  get '/edit/:id/fee' => "fee#edit", :as => "edit_fee"
  get '/fee/:id' => "fee#show", :as => "fee"
  put '/fee/:id' => "fee#update"
  patch '/fee/:id' => "fee#update"
  delete '/fee/:id' => "fee#destroy"

  get '/:event_id/ticket' => "ticket#index", :as => "tickets"
  post '/ticket/:event_id' => "ticket#create", :as => "/"
  get '/ticket/new' => "ticket#new", :as => "new_ticket"
  get '/edit/:id/ticket' => "ticket#edit", :as => "edit_ticket"
  get '/ticket/:id' => "ticket#show", :as => "ticket"
  put '/ticket/:id' => "ticket#update"
  patch '/ticket/:id' => "ticket#update"
  delete '/ticket/:id' => "ticket#destroy"

  get '/:event_id/waves' => "waves#index", :as => "waves"
  post '/waves/:event_id' => "waves#create", :as => "/"
  get '/waves/new' => "waves#new", :as => "new_wave"
  get '/edit/:id/waves' => "waves#edit", :as => "edit_wave"
  get '/waves/:id' => "waves#show", :as => "wave"
  put '/waves/:id' => "waves#update"
  patch '/waves/:id' => "waves#update"
  delete '/waves/:id' => "waves#destroy"

  get '/:event_id/promo_codes' => "referral_codes#index", :as => "referral_codes"
  post '/promo_codes/:event_id' => "referral_codes#create", :as => "/"
  get '/promo_codes/new' => "referral_codes#new", :as => "new_referral_code"
  get '/edit/:id/promo_codes' => "referral_codes#edit", :as => "edit_referral_code"
  get '/promo_codes/:id' => "referral_codes#show", :as => "referral_code"
  put '/promo_codes/:id' => "referral_codes#update"
  patch '/promo_codes/:id' => "referral_codes#update"
  delete '/promo_codes/:id' => "referral_codes#destroy"


  get '/profile' => 'profiles#show', :path => "/dashboard"
  
  get '/events/:id/registration' => "events#edit", :as => "registration"
  get '/events/:id/publish' => "events#edit", :as => "publish"
  get '/events/:id/other_info' => "events#edit", :as => "other_info"

  resources :events

  get ':path' => 'events#show', :as => "public_event"
  
  root 'home#index'  

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
end
