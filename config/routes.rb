Downhill::Application.routes.draw do

  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'
  
  match '/users/auth/:action/callback' => 'omniauth_callbacks#authorize_stripe', via: [:get, :post]

  get '/validate_referral_code/:code/:event_id' => "orders#validate_referral_code", :path => "/validate_referral_code/:code/:event_id"
  get '/validate_email_uniqueness/' => "orders#validate_email_uniqueness", :path => "/validate_email_uniqueness/"

  post '/orders/:event_id' => "orders#create", :as => "/"

  devise_for :users
  devise_for :participants, :controllers => { :registrations => "participants" }


  resources :settings
  resources :users
  resources :participants
  resources :teams
  resources :customers


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

  get '/:event_id/promo_codes' => "promo_codes#index", :as => "promo_codes"
  post '/promo_codes/:event_id' => "promo_codes#create", :as => "/"
  get '/promo_codes/new' => "promo_codes#new", :as => "new_promo_code"
  get '/edit/:id/promo_codes' => "promo_codes#edit", :as => "edit_promo_code"
  get '/promo_codes/:id' => "promo_codes#show", :as => "promo_code"
  put '/promo_codes/:id' => "promo_codes#update"
  patch '/promo_codes/:id' => "promo_codes#update"
  delete '/promo_codes/:id' => "promo_codes#destroy"

  get '/:event_id/affiliate_settings' => "affiliate_settings#index", :as => "affiliate_settings"
  post '/affiliate_settings/:event_id' => "affiliate_settings#create", :as => "/"
  get '/affiliate_settings/new' => "affiliate_settings#new", :as => "new_affiliate_settings"
  get '/edit/:id/affiliate_settings' => "affiliate_settings#edit", :as => "edit_affiliate_settings"
  get '/affiliate_settings/:id' => "affiliate_settings#show", :as => "affiliate_setting"
  put '/affiliate_settings/:id' => "affiliate_settings#update"
  patch '/affiliate_settings/:id' => "affiliate_settings#update"
  delete '/affiliate_settings/:id' => "affiliate_settings#destroy"

  get '/:event_id/orders/new' => "orders#new", :as => "new_order"
  post '/orders/:event_id' => "orders#create", :as => "/"
  get '/:event_id/success' => "orders#success", :as => "success_order"

  get '/dashboard' => 'dashboards#show'
  
  get '/events/:id/registration' => "events#edit", :as => "registration"
  get '/events/:id/publish' => "events#edit", :as => "publish"
  get '/events/:id/other_info' => "events#edit", :as => "other_info"
  get '/events/:id/waiver' => "events#waiver", :as => "event_waiver"

  resources :events

  get '/events/:id/:path(/:referral_code)' => 'events#show', :as => "public_event"
  
  # get '/faq' => "pages#faq"
  root 'pages#home'  

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
