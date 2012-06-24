Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '438969616129529', 'dfc6e7b39be7ca6712a45e1c93f386d3', :scope => 'email', :client_options => {:ssl =>{:ca_file=>"#{Rails.root}/config/cacert.pem"}}
  provider :identity, on_failed_registration: lambda { |env|IdentitiesController.action(:new).call(env)}

end