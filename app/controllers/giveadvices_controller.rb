class GiveadvicesController < ApplicationController
    

  # GET /giveadvices
  # GET /giveadvices.json
  def index
    #@giveadvices = Giveadvice.all
    #this will work - 051412
    #@adviceposts = Advicepost.all

    #limits to show only current users adviceposts! - works
    @adviceposts = current_user.adviceposts
    
    #limits to show only current users messages! - works
    @messages = current_user.messages
    
    #object which returns the messager responses - 
    #@messagers = current_user.messages.messager


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @giveadvices }
    end
  end
  

end
