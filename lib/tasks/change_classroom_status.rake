namespace :classrooms do
  desc 'change the classroom statuses to active or inactive'

  task :change_classrooms_status => :environment do
    old_classroom_names = ['Infants', 'Primary', 'Preschool', 'Toddlers']
    
    Classroom.unscoped.all.each do |classroom|
      if old_classroom_names.include?(classroom.name)
        classroom.active = false
      else
        classroom.active = true
      end
      classroom.save
    end
  end
end
