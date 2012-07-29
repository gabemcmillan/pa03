class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #helper_method :current_user
  



  #redirects devise user to getadvices path - need to redirect based on user or advisor
  def after_sign_in_path_for(resource)
    if current_user
        getadvices_path
  	elsif current_advisor
        giveadvices_path    
    else 
  	end
  end
  


  
  


  
  


	
	
    
  
  
  
end
