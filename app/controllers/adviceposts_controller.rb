class AdvicepostsController < ApplicationController

  
  # GET /adviceposts
  # GET /adviceposts.json
  def index
    #@adviceposts = Advicepost.all

    #limits to show only current users adviceposts! - works
    @adviceposts = current_advisor.adviceposts
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adviceposts }
    end
  end

  # GET /adviceposts/search
  # GET /adviceposts/search.json
  def search
    
    search = params[:search]
    miniresume = params[:miniresume]
    

    #thinking_sphinx conditions - 
    #@adviceposts = Advicepost.search :conditions=>{:search=>params[:search]},{:miniresume=>params[:miniresume]}
    #@adviceposts = Advicepost.search :conditions=>["search=? and miniresume=?",search,miniresume]
    #@adviceposts = Advicepost.search(:conditions=>{:search=>search,:miniresume=>miniresume})
    @adviceposts = Advicepost.search(search,miniresume)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adviceposts }
    end
  end
  
  
  # GET /adviceposts/apnew/1
  # GET /adviceposts/apnew/1.json
  def apnew
    @advicepost = Advicepost.find(params[:id])

    respond_to do |format|
      format.html # apnew.html.erb
      format.json { render json: @advicepost }
    end
  end
  
  # GET /adviceposts/alistings
  # GET /adviceposts/alistings.json
  def alistings
    #limits to show only current users adviceposts! - works - does it work if its null?  -it should return a nil 
    @adviceposts = current_advisor.adviceposts
    

    respond_to do |format|
      format.html # apnew.html.erb
      format.json { render json: @advicepost }
    end
  end
  
  # GET /adviceposts/1
  # GET /adviceposts/1.json
  def show
    @advicepost = Advicepost.find(params[:id])

    @products = Product.all

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
    @advicepost.advisor_id = current_advisor.id
    @advicepost.status = "Submitted"
    
    @rating = Rating.new
    @rating.score = 0
    @rating.advisor_id = current_advisor.id
    @rating.rating_select = nil
    
    @advisor = Advisor.find(:first, :conditions => {:id=>current_advisor.id})
    @advisor.status = params[:status]
    @advisor.tokenID = params[:tokenID]
    @advisor.refundTokenID = params[:refundTokenID]
    @advisor.save
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @advicepost }
    end
  end

  # GET /adviceposts/1/edit
  def edit
    @advicepost = Advicepost.find(params[:id])    
  end
  
  # GET /adviceposts/1/rating
  def rating
   @advicepost = Advicepost.find(params[:id])
   
   @message = Message.find(params[:m_id])
   @message.status = "Rated"
   
   @rating = Rating.find(:first, :conditions => {:advicepost_id=> @advicepost.id})
   @rating.rating_select = ""
   
   respond_to do |format|
     format.html # rating.html.erb
     format.json { render json: @advicepost }
   end
  end

  # PUT /adviceposts/1
  # PUT /adviceposts/1.json
  def update
    @advicepost = Advicepost.find(params[:id])
    
    respond_to do |format|
        #logic for user giving the advisor response a rating - will add the score.  
        if current_user
          #@message = Message.find(params[:m_id])
          if @advicepost.update_attributes(params[:advicepost])
            format.html { redirect_to getadvices_path, notice: 'Thanks for rating your advisors message!' }
            format.json { head :no_content }
          else
              format.html { redirect_to getadvices_path }
              format.json { render json: @advicepost.errors, status: :unprocessable_entity }
          end
        elsif current_advisor
          if @advicepost.update_attributes(params[:advicepost])
            format.html { redirect_to apnew_path(@advicepost), notice: 'Advice Listing was successfully updated.' }
            format.json { head :no_content }
          else
              format.html { render action: "edit" }
              format.json { render json: @advicepost.errors, status: :unprocessable_entity }
          end
        end
    end
  end

  # POST /adviceposts
  # POST /adviceposts.json
  def create
    @advicepost = Advicepost.new(params[:advicepost])
    #set advisor id attribute
    @advicepost.advisor_id = current_advisor.id
    #save categoryname in the advicepost listing
    @advicepost.categoryname = @advicepost.category.categoryname
    @rating = Rating.new(params[:rating])
        
    #Send email to advisee they have sent a new message to advisor
    UserMailer.delay(queue: "email_new_advicepost_advisor").new_advicepost_advisor(current_advisor)
    #Send email to pa admin to notify them new advicepost has been created to review
    UserMailer.delay(queue: "email_new_advicepost_admin").new_advicepost_admin(@advicepost)
    
    respond_to do |format|
      if @advicepost.save
        format.html { redirect_to apnew_path(@advicepost), notice: 'Your Advice Listing has been submitted! You should hear back soon after we review your listing.' }
        format.json { render json: @advicepost, status: :created, location: @advicepost }
      else
        format.html { render action: "new" }
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
      format.html { redirect_to giveadvices_path }
      format.json { head :no_content }
    end
  end
end
