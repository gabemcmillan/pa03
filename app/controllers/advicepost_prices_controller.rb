class AdvicepostPricesController < ApplicationController
  # GET /advicepost_prices
  # GET /advicepost_prices.json
  def index
    @advicepost_prices = AdvicepostPrice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @advicepost_prices }
    end
  end

  # GET /advicepost_prices/1
  # GET /advicepost_prices/1.json
  def show
    @advicepost_price = AdvicepostPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @advicepost_price }
    end
  end

  # GET /advicepost_prices/new
  # GET /advicepost_prices/new.json
  def new
    @advicepost_price = AdvicepostPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @advicepost_price }
    end
  end

  # GET /advicepost_prices/1/edit
  def edit
    @advicepost_price = AdvicepostPrice.find(params[:id])
  end

  # POST /advicepost_prices
  # POST /advicepost_prices.json
  def create
    @advicepost_price = AdvicepostPrice.new(params[:advicepost_price])

    respond_to do |format|
      if @advicepost_price.save
        format.html { redirect_to @advicepost_price, notice: 'Advicepost price was successfully created.' }
        format.json { render json: @advicepost_price, status: :created, location: @advicepost_price }
      else
        format.html { render action: "new" }
        format.json { render json: @advicepost_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /advicepost_prices/1
  # PUT /advicepost_prices/1.json
  def update
    @advicepost_price = AdvicepostPrice.find(params[:id])

    respond_to do |format|
      if @advicepost_price.update_attributes(params[:advicepost_price])
        format.html { redirect_to @advicepost_price, notice: 'Advicepost price was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @advicepost_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advicepost_prices/1
  # DELETE /advicepost_prices/1.json
  def destroy
    @advicepost_price = AdvicepostPrice.find(params[:id])
    @advicepost_price.destroy

    respond_to do |format|
      format.html { redirect_to advicepost_prices_url }
      format.json { head :no_content }
    end
  end
end
