class AdvicepostsController < ApplicationController

  
  # GET /adviceposts
  # GET /adviceposts.json
  def index
    #@adviceposts = Advicepost.all

    #thinking_sphinx 
    @adviceposts = Advicepost.search(params[:search], page: 1, per_page: 20)
  
    
    #limits to show only current users adviceposts! - works
    #@adviceposts = current_user.adviceposts

    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adviceposts }
    end
  end

  # GET /advicepostssearch
  # GET /advicepostssearch.json
  def search
    #@adviceposts = Advicepost.all

    #thinking_sphinx 
    @adviceposts = Advicepost.search(params[:search], page: 1, per_page: 20)
    
    #limits to show only current users adviceposts! - works
    #@adviceposts = current_user.adviceposts
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adviceposts }
    end
  end
  
  

  # GET /adviceposts/1
  # GET /adviceposts/1.json
  def show
    @advicepost = Advicepost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @advicepost }
    end
  end


  # GET /adviceposts/new
  # GET /adviceposts/new.json
  def new
    @advicepost = Advicepost.new

    #set user id attribute
    @advicepost.user_id = current_user.id
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @advicepost }
    end
  end

  # GET /adviceposts/1/edit
  def edit
    @advicepost = Advicepost.find(params[:id])
    
    
  end

  # POST /adviceposts
  # POST /adviceposts.json
  def create

    @advicepost = current_user.adviceposts.build(params[:advicepost])

    respond_to do |format|

      if @advicepost.save
        format.html { redirect_to giveadvices_path, notice: 'Congratulations! Your new advice listing was successfully posted!' }
        format.json { render json: @advicepost, status: :created, location: @advicepost }
      else
        format.html { render action: "new" }
        format.json { render json: @advicepost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /adviceposts/1
  # PUT /adviceposts/1.json
  def update
    @advicepost = Advicepost.find(params[:id])

    respond_to do |format|
      if @advicepost.update_attributes(params[:advicepost])
        format.html { redirect_to @advicepost, notice: 'Advicepost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @advicepost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adviceposts/1
  # DELETE /adviceposts/1.json
  def destroy
    @advicepost = Advicepost.find(params[:id])
    @advicepost.destroy

    respond_to do |format|
      format.html { redirect_to adviceposts_url }
      format.json { head :no_content }
    end
  end
end
