# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Seed classroom values
Classroom.create([
  {
    :name => 'Infants'
  },
  {
    :name => 'Toddlers'
  },
  {
    :name => 'Preschool'
  },
  {
    :name => 'Primary'
  },
  {
    :name => 'All'
  }
])

# Seed Services
# DateTime create format:
#   civil(y=-4712, m=1, d=1, h=0, min=0, s=0, of=0, sg=ITALY)

# Create 4 services for 4 weeks
# Saturday @ 1800hrs, Sunday at 0900hrs, 1115hrs, 1700hrs
def create_service_set(seed_date)
  year = seed_date.year

  one_day_back = seed_date - 1
  sat_time = DateTime.civil(year, one_day_back.month, one_day_back.day, 18)

  sun_9_time = DateTime.civil(year, seed_date.month, seed_date.day, 9)

  sun_1115_time = DateTime.civil(year, seed_date.month, seed_date.day, 11, 15)

  sun_5_time = DateTime.civil(year, seed_date.month, seed_date.day, 17)

  [sat_time, sun_9_time, sun_1115_time, sun_5_time]
end

start_month = 9
start_day = 4

seed_date = DateTime.civil(2011, 9, 4)

(0..3).each do |x|
  # Create a seed date (x * 7) days into the future
  service_set = create_service_set(seed_date + (x * 7))

  service_set.each do |s|     
    Service.create({ :service_date => s })
  end
end

# Master Admin
# !!! Change password in production
v = Volunteer.create({ 
  :email => 'masteradmin@cmtracker.org',
  :password => 'MasterPassword'
})

v.first_name = 'Master'
v.last_name = 'Admin'
v.admin = true
