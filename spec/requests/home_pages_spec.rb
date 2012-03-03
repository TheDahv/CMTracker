require 'spec_helper'

describe "HomePages" do
  subject { page }

  describe "Home page" do
    let(:volunteer) { FactoryGirl.create(:volunteer) }
    
    before do 
      visit root_path 
      sign_in(volunteer)
    end

    it { should have_selector('p', :text => 'Pick a class to list the students') }
  end
end
