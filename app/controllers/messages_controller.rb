class MessagesController < ApplicationController
  
  #devise ensure user is logged in
  before_filter :authenticate_advisor!, only: :messager
  before_filter :authenticate_user!, only: :showadvisee
  
  
    
  # GET /messages
  # GET /messages.json
  def index
    #@messages = Message.all
    
    @messages = Message.page(params[:page]).order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def showadvisee
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end
  
  
  
  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    
    #set transaction_id 
    @message.transaction_id = params[:requestId]
    
    #set user id attribute
    @message.user_id = current_user.id
    @message.status = "New"
    @advicepost = Advicepost.find(params[:referenceId])
    @message.advicepost_id = @advicepost.id
    @message.advisor_id = @advicepost.advisor_id
    @advisor = Advisor.find(:first, :conditions => { :id => @message.advisor_id})
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end
  
  # POST /messages
  # POST /messages.json
  def create
    @message = current_user.messages.build(params[:message])
    @advisor = Advisor.find(:first, :conditions => { :id => @message.advisor_id})
    
    respond_to do |format|
      if @message.save
         
        #Send email to advisee they have sent a new message to advisor
        UserMailer.delay(queue: "email_new_message").new_message_sent_advisee(current_user)
        #Send email to advisor to notify they have a new Advisee message
        UserMailer.delay(queue: "email_new_message").new_message_sent_advisor(@advisor, @message)
        
        format.html { redirect_to getadvices_path, notice: 'Your message has been sent to your advisor! They should respond soon!' }
        format.json { render json: @message, status: :created, location: @message }
        
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end
  
  # GET /messages/1/messageq
  def messageq
    @message = Message.find(params[:id])
  end

  
  # GET /messages/1/messager
  def messager
    @message = Message.find(params[:id])
    @message.status = "Responded"
    
  end

  # GET /messages/1/messagec
  def messagec
    @message = Message.find(params[:id])
    @message.status = "Canceled"
  end
  
  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])
    @user = User.find(:first, :conditions => { :id => @message.user_id})
    
    respond_to do |format|
      if @message.update_attributes(params[:message])
        #send if messager is not null
        if @message.messager.blank?
        else
        #Braintree Submit for settlement - should charge advisee price they payed for message since Advisor responded.  
        result = Braintree::Transaction.submit_for_settlement(@message.transaction_id)
        
        if result.success?
          # transaction successfully submitted for settlement
            #Send email to advisor they have responded - not working somehow
            UserMailer.delay(queue: "email_message_response").response_sent_advisor(current_advisor)
            #Send email to advisee their advisor has responded - works
            UserMailer.delay(queue: "email_message_response").response_sent_advisee(@user, @message)
        else
          p result.errors
        end
      end
        
        format.html { redirect_to @message, notice: 'You have successfully responded to your advisee. Your account has been credited with the message payment. They are on their way to a smarter path thanks to you!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
