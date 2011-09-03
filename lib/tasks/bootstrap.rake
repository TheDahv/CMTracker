namespace :bootstrap do
  desc 'set up admin account'

  task :setup_admin_account => :environment do
    if Volunteer.where(:email => 'masteradmin@cmtracker.org').count == 0
      Volunteer.create!(
        :email => 'masteradmin@cmtracker.org'
      )
    end

    v = Volunteer.where(:email => 'masteradmin@cmtracker.org')[0]
    v.password = 'MasterPassword'
    v.first_name = 'Master'
    v.last_name = 'Admin'
    v.admin = true
    v.save
  end

  task :all => [:setup_admin_account]
end
