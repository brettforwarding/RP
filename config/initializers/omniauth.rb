OmniAuth.config.logger = Rails.logger 
 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']#,  {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}#,{:scope ≥ 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access, publish_stream'}
end
