class AdvicepostsController < ApplicationController

  
  # GET /adviceposts
  # GET /adviceposts.json
  def index
    #@adviceposts = Advicepost.all

    #thinking_sphinx 
    #@adviceposts = Advicepost.search(params[:search], page: 1, per_page: 10).page(params[:page]).per_page(2).order('created_at DESC')
        
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
    #@adviceposts = Advicepost.all

    #thinking_sphinx 
    @adviceposts = Advicepost.search(params[:search], page: 1, per_page: 15)
    
    #limits to show only current users adviceposts! - works
    #@adviceposts = current_advisor.adviceposts
    
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
        if current_user
          @score_select = params[:score_select]
          #do logic if the upvote or downvote, do if,else if thumbs up or thumbs down value is selected. 
          if @score_select == "Up"
           @advicepost.score = @advicepost.score + 5
          else 
            @advicepost.score -= 5
          end
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
    #save categoryname in the advicepost listing - worked!
    @advicepost.categoryname = @advicepost.category.categoryname
    
    #Send email to advisee they have sent a new message to advisor
    UserMailer.delay(queue: "email_new_advicepost").new_advicepost_advisor(current_advisor)
  
    respond_to do |format|

      if @advicepost.save
        format.html { redirect_to apnew_path(@advicepost), notice: 'Congratulations! Your new advice listing was successfully posted! You are advancing human knowledge sharing.' }
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
