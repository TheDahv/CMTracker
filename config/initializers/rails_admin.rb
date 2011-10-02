RailsAdmin.config do |config|
  # This setting is to keep things from slowing down in prod
  #config.reload_between_requests = false

  # Fix for Heroku
  # http://devcenter.heroku.com/articles/using-compass
  project_type  = :rails
  http_path     = '/'
  css_dir       = 'tmp/stylesheets'
  sass_dir      = 'app/view/stylesheets'

  # Sync it up with our model classes
  config.current_user_method do
    current_volunteer
  end

  # Check to see if the volunteer has admin status
  config.authorize_with do 
    redirect_to root_path unless warden.user.is_admin?
  end

  # Exclude the importer class from this scope
  config.excluded_models << "DTCMAttendanceImporter"

  config.label_methods = [:admin_label]

  config.model Child do
    list do
      field :id
      field :first_name
      field :last_name
      field :birthday
      field :age
      field :classroom
      field :notes
      field :inactive
    end

    show do 
      field :first_name
      field :last_name
      field :birthday
      field :age
      field :classroom
      field :notes
      field :inactive
    end
  end
end
