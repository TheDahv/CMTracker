def sign_in(volunteer)
  fill_in 'Email', :with => volunteer.email
  fill_in 'Password', :with => volunteer.password
  click_button 'Sign in'
end
