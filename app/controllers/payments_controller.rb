class PaymentsController < InheritedResources::Base
  
  
  def confirm
      @payment = Payment.new(
        :transaction_amount => params[:transactionAmount],
        :transaction_id     => params[:transactionId]
      )
      if @payment.save
        redirect_to(@payment, :notice => 'Payment was successfully created.')
      else
        redirect_to :action => "index"
      end
    end
    
  
    
    
end
