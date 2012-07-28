class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  



  #redirects devise user to dashboard index path - need to redirect based on user or advisor
  def after_sign_in_path_for(resource)
    #current_user_path
    dashboard_index_path
    
  end
  
  


    
  
  
  
end
