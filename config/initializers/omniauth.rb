Rails.application.config.middleware.use OmniAuth::Builder do
  FACEBOOK_APP_ID     = ENV["FACEBOOK_APP_ID"]
  FACEBOOK_APP_SECRET = ENV["FACEBOOK_APP_SECRET"]
  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, :scope => "offline_access", :display => "popup"
end
