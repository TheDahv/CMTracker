require 'spec_helper'

describe "Home Page" do
  subject { page }
  let(:volunteer) { FactoryGirl.create(:volunteer) }

  before { visit root_path }
  describe "requires authentication" do
    it { should have_selector('h2', :text => 'Sign in') } 
  end

  describe "as signed in volunteer" do
    before { sign_in(volunteer) }
    it { should have_selector('p', :text => 'Pick a class to list the students') }
  end
end
