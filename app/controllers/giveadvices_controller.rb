class GiveadvicesController < ApplicationController
  
  #devise ensure user is logged in
  before_filter :authenticate_advisor!
  

  # GET /giveadvices
  # GET /giveadvices.json
  def index


    #limits to show only current users adviceposts! - works - does it work if its null?  -it should return a nil 
    @adviceposts = current_advisor.adviceposts
        
    #limits to show only current users new messages! - works - 
    @messages = current_advisor.messages.page(params[:page]).order('created_at DESC').where("status = ?", 'New')

    
    #show past messages with current user where status is Responded or Cancelled
    @messagesp = current_advisor.messages.page(params[:page]).order('created_at DESC').where("status = ? OR status 
      = ? OR status = ? OR status = ?", 'Responded', 'Canceled', 'New', 'Rated')
        

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @giveadvices }
    end
    
  end

  
  
  def payments

  

  end

  
  
end
