require 'spec_helper'

describe "Home Page" do
  subject { page }
  let(:volunteer) { FactoryGirl.create(:volunteer) }

  before { visit root_path }
  describe "requires authentication" do
    it { should have_selector('h2', :text => 'Sign in') } 
  end

  describe "as signed in volunteer" do
    before do
      sign_in(volunteer)
    end
    it { should have_selector('p', :text => 'Pick a class to list the students') }

    describe "classroom selector" do
      seed
      let(:classes) { Classroom.all.map { |c| c.name } }
      puts Classroom.all.count
      it { should have_select('class_id', :options => classes) }
    end
  end
end
