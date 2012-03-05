def sign_in(volunteer)
  fill_in 'Email', :with => volunteer.email
  fill_in 'Password', :with => volunteer.password
  click_button 'Sign in'
end

def seed
  make_classes
  make_kids
  make_services
end

private
  def make_classes
     %w{Nursery Toddler1 Toddler2 456 7+ Inactive}.each do |name|
      make_classroom(name) 
    end
    Classroom.find_by_name('Inactive').toggle!(:active)
  end

  def make_kids
    Classroom.all.each do |classroom|
      10.times do
        classroom.children.create( 
          :first_name => Faker::Name.first_name,
          :last_name => Faker::Name.last_name,
          :inactive => false
        ) 
      end
    end
  end

  def make_classroom(name) 
    Classroom.create!(
      :name => name,
      :active => true
    )
  end

  def make_services
    s = Service.create!(:service_date => DateTime.civil(2012, 2, 24))
  end
