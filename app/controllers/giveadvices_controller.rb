class GiveadvicesController < ApplicationController
  
  #devise ensure user is logged in
  before_filter :authenticate_advisor!
  

  # GET /giveadvices
  # GET /giveadvices.json
  def index
    #@giveadvices = Giveadvice.all
    #this will work - 051412
    #@adviceposts = Advicepost.all

    #limits to show only current users adviceposts! - works - does it work if its null?  -it should return a nil 
    @adviceposts = current_advisor.adviceposts
    
    
    #limits to show only current users messages! - works - 
    @messages = current_advisor.messages.page(params[:page]).per_page(4).order('created_at DESC')
    

    
    
    #object which returns the messager responses - 
    #@messagers = current_user.messages.messager


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @giveadvices }
    end
  end
  

end
