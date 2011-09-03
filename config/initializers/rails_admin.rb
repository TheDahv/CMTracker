RailsAdmin.config do |config|
  # This setting is to keep things from slowing down in prod
  #config.reload_between_requests = false

  # Sync it up with our model classes
  config.current_user_method do
    current_volunteer
  end

  # Check to see if the volunteer has admin status
  config.authorize_with do 
    redirect_to root_path unless warden.user.is_admin?
  end
end
