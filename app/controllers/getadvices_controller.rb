class GetadvicesController < ApplicationController

  
  # GET /getadvices
  # GET /getadvices.json
  def index
    @getadvices = Getadvice.all


    #return all advicesposts after search 
    @adviceposts = Advicepost.all


    #limits to show only current users adviceposts! - works
    @messages = current_user.messages.page(params[:page]).per_page(4).order('created_at DESC')


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @getadvices }
    end
  end

  # GET /getadvices/1
  # GET /getadvices/1.json
  def show
    @getadvice = Getadvice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @getadvice }
    end
  end

  # GET /getadvices/new
  # GET /getadvices/new.json
  def new
    @getadvice = Getadvice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @getadvice }
    end
  end

  # GET /getadvices/1/edit
  def edit
    @getadvice = Getadvice.find(params[:id])
  end

  # POST /getadvices
  # POST /getadvices.json
  def create
    @getadvice = Getadvice.new(params[:getadvice])

    respond_to do |format|
      if @getadvice.save
        format.html { redirect_to @getadvice, notice: 'Getadvice was successfully created.' }
        format.json { render json: @getadvice, status: :created, location: @getadvice }
      else
        format.html { render action: "new" }
        format.json { render json: @getadvice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /getadvices/1
  # PUT /getadvices/1.json
  def update
    @getadvice = Getadvice.find(params[:id])

    respond_to do |format|
      if @getadvice.update_attributes(params[:getadvice])
        format.html { redirect_to @getadvice, notice: 'Getadvice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @getadvice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /getadvices/1
  # DELETE /getadvices/1.json
  def destroy
    @getadvice = Getadvice.find(params[:id])
    @getadvice.destroy

    respond_to do |format|
      format.html { redirect_to getadvices_url }
      format.json { head :no_content }
    end
  end
end
