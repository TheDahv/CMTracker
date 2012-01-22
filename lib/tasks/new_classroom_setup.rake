namespace :new_classroom_setup do
  desc 'create new classrooms and move kids accordingly'

  task :create_classrooms => :environment do 
    # New classroom names
    %w{Nursery Toddler1 Toddler2 456 7+}.each do |name|
      if Classroom.find_by_name(name).nil?
        c = Classroom.new()
        c.name = name

        c.save
      end
    end

  end

  task :move_kids => :environment do
    # Note: this process depends on all kids having
    # their birthdays filled in. 

    action = Proc.new do |child, classroom| 
      puts "Moving #{child.to_s} to #{classroom.name}"
      child.classroom_id = classroom.id
      child.save
    end

    find_by_condition = Proc.new do |classroom, condition|
      Child.all.select(&condition).each do |c|
        action.call(c, classroom)
      end
    end
    
    # Move all kids under 1 to the Nursery
    nursery_classroom = Classroom.find_by_name('Nursery')
    nursery_condition = Proc.new { |child| child.birthday.nil? == false && child.age < 1 }
    find_by_condition.call(nursery_classroom, nursery_condition)

    # Move all 1 year olds to Toddler1
    toddler_1_classroom = Classroom.find_by_name('Toddler1')
    toddler_1_condition = Proc.new { |child| child.birthday.nil? == false && child.age == 1 }
    find_by_condition.call(toddler_1_classroom, toddler_1_condition)

    # Move all 2-3 year olds to Toddler2
    toddler_2_classroom = Classroom.find_by_name('Toddler2')
    toddler_2_condition = Proc.new { |child| child.birthday.nil? == false && (child.age == 2 || child.age == 3) }
    find_by_condition.call(toddler_2_classroom, toddler_2_condition)

    # Move all 456 year olds to 456
    fourtosix_classroom = Classroom.find_by_name('456')
    fourtosix_condition = Proc.new { |child| child.birthday.nil? == false && child.age >= 4 && child.age <= 6 }
    find_by_condition.call(fourtosix_classroom, fourtosix_condition)
    
    # Move all 7+ year olds to 7+
    seven_classroom = Classroom.find_by_name('7+')
    seven_condition = Proc.new { |child| child.birthday.nil? == false && child.age >= 7 }
    find_by_condition.call(seven_classroom, seven_condition)

  end

  task :all => [:create_classrooms, :move_kids]

end
