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
        
    #limits to show only current users new messages! - works - 
    @messages = current_advisor.messages.page(params[:page]).order('created_at DESC').where("status = ?", 'New')
    
    #limits to show only current users responded or cancelled messages - works - 
    #@messagesp = current_advisor.messages.page(params[:page]).order('created_at DESC')
    
    #works - 
    #@messagesp = current_advisor.messages.where("status = ? OR status = ?", 'Responded',  'Cancelled')
    
    #show past messages with current user where status is Responded or Cancelled
    @messagesp = current_advisor.messages.page(params[:page]).order('created_at DESC').where("status = ? OR status = ?", 'Responded',  'Cancelled')
    
    
    
    
    #object which returns the messager responses - 
    #@messagers = current_user.messages.messager


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @giveadvices }
    end
  end
  

end
