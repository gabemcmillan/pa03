class TransactionsController < ApplicationController
  before_filter :authenticate_user!

  def new

    if current_user.has_payment_info?
      current_user.with_braintree_data!
      @credit_card = current_user.default_credit_card
      @advicepost = Advicepost.find(params[:advicepost_id])
      @tr_data = Braintree::TransparentRedirect.transaction_data(:redirect_url => confirm_transaction_url(:advicepost_id => @advicepost.id),
                                                                 :transaction => {
                                                                   :amount => @advicepost.price,
                                                                   :type => "sale",
                                                                   :customer_id => current_user.braintree_customer_id
                                                                  })
    else
      redirect_to new_customer_path
    end
  end


  def confirm
    @result = Braintree::TransparentRedirect.confirm(request.query_string)
    @advicepost = Advicepost.find(params[:advicepost_id])
    
    if @result.success?
      render :confirm
    else
      @advicepost = Advicepost.find(params[:advicepost_id])
      current_user.with_braintree_data!
      @credit_card = current_user.default_credit_card
      render :new
    end
  end

end
