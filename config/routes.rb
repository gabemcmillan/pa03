Pa02::Application.routes.draw do


  
  
  

  devise_for :admins

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "ratings/index"


  
  #Advisee authentication
  devise_for :users
  devise_scope :users do
   get 'getadvices', :to => 'getadvices#index', :as => :user_root # Rails 3
  end
  
  #Advisor authentication
  devise_for :advisors
  devise_scope :advisors do
   get 'giveadvices', :to => 'giveadvices#index', :as => :advisor_root # Rails 3
  end
  
  #Homepage routes - 
  root :to=> "home#index"
  get "home/index"
  get "home/howitworks"
  get "home/about"
  get "home/privacy"
  get "home/terms"
  get "home/howitworks_signedin"
  
  
  get "dashboard/index"
  get "welcome/index"
  
  #braintree credit card payments for user devise
  resources :customer, :only => [:new, :edit]
  resources :credit_card_info, :only => [:edit]
  match 'customer/confirm' => 'customer#confirm', :as => :confirm_customer
  match 'credit_card_info/confirm' => 'credit_card_info#confirm', :as => :confirm_credit_card_info
  match 'transactions/:advicepost_id/new' => 'transactions#new', :as => :new_transaction
  match 'transactions/confirm/:advicepost_id' => 'transactions#confirm', :as => :confirm_transaction
  
  resources :payments
      match 'confirm_payment' => 'payments#confirm'
  
  match 'getadvices/payments' => 'getadvices#payments', :as => :getadvice_payments
  match 'giveadvices/payments' => 'giveadvices#payments', :as => :giveadvice_payments
  
  

  resources :messages
  resources :ratings
  
  
  #new route for message response form
  match 'messages/:id/messager', to: 'messages#messager', :as => :messager
  
  #new route for show advisee message 
  match 'messages/:id/showadvisee', to: 'messages#showadvisee', :as => :showadvisee
    
  
  resources :advicepost_prices
  resources :categories
  
  
  #route for adviceposts search view
  match 'adviceposts/search', to: "adviceposts#search", :as => :apsearch
  
  #congrats page for new advice listing
  match 'adviceposts/:id/apnew', :controller => 'adviceposts', :action => 'apnew', :as => :apnew
  
  #separate page to show advisors advice listings 
  match 'adviceposts/alistings', :controller => 'adviceposts', :action => 'alistings', :as => :alistings
  
  #ratings page for advisor message after adviceposts 
  match 'adviceposts/:id/rating', to: 'adviceposts#rating', :as => :rating
  
    
  resources :adviceposts do
    member do  
      get 'apnew'
      get 'alistings'
    end
  end
  
    
  resources :getadvices
  resources :giveadvices



  

  
  
end
