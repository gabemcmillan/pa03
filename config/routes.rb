Pa02::Application.routes.draw do

  #Authentication Routes - 
  
  #Admin authentication
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  
  #Advisee authentication

  devise_for :users do
   get 'getadvices', :to => 'getadvices#index', :as => :user_root # Rails 3
  end
  
  
  #Advisor authentication
  devise_for :advisors do
   get 'giveadvices', :to => 'giveadvices#index', :as => :advisor_root # Rails 3
  end
  

  
    
  
  #Homepage routes - 
  root :to=> "home#index"
  get "home/index"
  
  
  get "dashboard/index"
  

  resources :messages
  
  #new route for message response form
  match 'messages/:id/messager', to: 'messages#messager', :as => :messager
  
  
  resources :advicepost_prices
  resources :categories
  
  
  #route for adviceposts search view
  match 'adviceposts/search', to: "adviceposts#search", :as => :apsearch
  
  #congrats page for new advice listing
  match 'adviceposts/:id/apnew', :controller => 'adviceposts', :action => 'apnew', :as => :apnew
    
  resources :adviceposts do
    member do  
      get 'apnew'
    end
  end
  
  

  
  resources :getadvices
  resources :giveadvices



  
  
  
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
