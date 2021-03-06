StartupSocial::Application.routes.draw do


  #get "settings" , to: "settings#index"

  #put "settingsupdate" => "settings#update"



  # resource :user, only: [:settings] do
  #   collection do
  #     patch 'update_password'
  #   end
  # end


  get "settings"  => "users#settings"

  resource :user, only: [:settings] do
    collection do
      patch 'update_password'
    end
  end



  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags
  resources :likes
  resources :activities

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :authentications

  resources :deleteposts

  resources :comments

  resources :post_pics

  resources :posts do
    resources :comments, :likes
  end

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  # post '/posts/143'

  resource :splash_screen do
    member {post :vote}
  end


  get "flatuipro_demo/index"
  resources :profile_pics

  root 'splash_screen#index'

  resources :relationships

  resources :profiles do
    resources :likes
    member do
      get :following, :followers, :usersearch, :usersearch1, :usersearch2, :beverlyhillsuser, :burbank, :downtown, :hollywoodusers, :culvercityusers, :santamonicausers, :pasadenausers, :sanfernandovalleyusers, :venicebeachuser
    end
  end

  resources :requests, only: [:create, :destroy]

  devise_for :users , :path_names => {:sign_up => "register"}, :controllers => {:registrations => "registrations"}
  #resources :users, only: [:index, :new, :create, :show, :destroy, :edit, :update]
  #controllers: { omniauth_callbacks: "omniauth_callbacks" }

  get '/profiles/:id', :to => 'users#show', :as => :user

  #get '/auth/linkedin/callback' => 'authentications#create'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
