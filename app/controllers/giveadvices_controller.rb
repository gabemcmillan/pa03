class GiveadvicesController < ApplicationController
  before_filter :authenticate_user!, except: [:index,:show]  

  # GET /giveadvices
  # GET /giveadvices.json
  def index
    #@giveadvices = Giveadvice.all
    #this will work - 051412
    #@adviceposts = Advicepost.all

    #limits to show only current users adviceposts! - works
    @adviceposts = current_user.adviceposts
    
    #limits to show only current users messages! - works
    @messages = current_user.messages.page(params[:page]).per_page(4).order('created_at DESC')
    

    
    
    #object which returns the messager responses - 
    #@messagers = current_user.messages.messager


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @giveadvices }
    end
  end
  

end
