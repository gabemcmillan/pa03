

class User < ActiveRecord::Base
  after_create :send_welcome_email 

  private

    def send_welcome_email
      UserMailer.deliver_welcome_email(current_user).deliver
    end
end




