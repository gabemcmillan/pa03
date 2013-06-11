class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #helper_method :current_user
  



  #redirects devise user to getadvices path - need to redirect based on user or advisor
  def after_sign_in_path_for(resource)
    if current_user
        #getadvices_path
        (session[:user_return_to].nil?) ? "/getadvices" : session[:user_return_to].to_s 
  	elsif current_advisor
  	      #giveadvices_path   
          (session[:advisor_return_to].nil?) ? "/giveadvices" : session[:advisor_return_to].to_s 
    elsif current_admin
        rails_admin_path
  	end
  end
  



  
  


	
	
    
  
  
  
end
