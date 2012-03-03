def sign_in(volunteer)
  fill_in 'Email', :with => volunteer.email
  fill_in 'Password', :with => volunteer.password
  click_button 'Sign in'
end

def seed
  make_classroom("Nursery")

  make_classroom("Toddler1")

  make_classroom("Toddler2")

  make_classroom("456")

  make_classroom("7+")

  c = make_classroom("Inactive")
  c.toggle!(:active)
end

private
  def make_classroom(name) 
    c = FactoryGirl.create(:classroom)
    c.name =  name
    c.active = true

    c
  end
