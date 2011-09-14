Cheerlist::Application.routes.draw do
  resources :locations

  resources :predictions

  resources :friendships

  get "omniauth_callbacks/facebook"

  get "omniauth_callbacks/open_id"

  #devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  match "/users/:user_id" => "profiles#show", :via => :get, :as => :profile
  match "/users/:user_id/edit" => "profiles#edit", :via => :get, :as => :edit_profile
  match "/users/:user_id" => "profiles#update", :via => :put, :as => :profile
  
  match "/users/:user_id/check_ins" => "check_ins#index", :via => :get, :as => :check_ins
  match "/games/:game_id/check_ins/new" => "check_ins#new", :via => :get, :as => :new_game_check_ins
  match "/games/:game_id/check_ins" => "check_ins#create", :via => :post, :as => :game_check_ins

  match "/teams" => "teams#index", :via => :get, :as => :teams
  match "/teams/:id" => "teams#show", :via => :get, :as => :team
  
  get "/games/autocomplete_team_name"
  match "/games/search/" => "games#search", :via => :get, :as => :games_search
  match "/games" => "games#index", :via => :get, :as => :games
  match "/games/:id" => "games#show", :via => :get, :as => :game
  match "/leaderboard" => "games#leaderboard", :via => :get, :as => :leaderboard
  
  match "/games/:game_id/comments" => "comments#create", :via => :post, :as => :game_comments
  match "/comments/:id" => "comments#update", :via => :put, :as => :comment
  match "/comments/:id" => "comments#destroy", :via => :delete, :as => :comment
  
  match "/games/:game_id/predictions" => "predictions#create", :via => :post, :as => :game_predictions
  
  match "/activities" => "activities#index", :via => :get, :as => :activities
  
  root :to => "pages#index"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
