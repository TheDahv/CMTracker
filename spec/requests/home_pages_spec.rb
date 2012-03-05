require 'spec_helper'

describe "Home Page" do
  subject { page }
  let(:volunteer) { FactoryGirl.create(:volunteer) }

  before { visit root_path }
  describe "requires authentication" do
    it { should have_selector('h2', :text => 'Sign in') } 
  end

  describe "as signed in volunteer" do
    seed
    before { sign_in(volunteer) }
    it { should have_selector('p', :text => 'Pick a class to list the students') }

    describe "classroom selector" do
      let(:classes) { Classroom.all.map { |c| c.name } }
      it { should have_select('class_id', :options => classes) }
    end

    describe "checking in students" do
      let!(:classroom) { FactoryGirl.create(:classroom) }
      let!(:service) { FactoryGirl.create(:service) }
      let!(:children) do
        20.times { FactoryGirl.create(:child, :classroom => classroom ) } 
      end

      it { should have_selector('form.class_select') }

      before do 
        click_button "Show Class" 
      end

      it "should add a check in" do
        expect do
          page.driver.post('/processCheckin', 
            { 
              :service_id => 1, 
              :classroom_id => 1, 
              :child_id => 1
            }
          )
        end.should change(Attendance, :count).by(1)
      end
    end

    describe "undoing a checkin" do
      let!(:classroom) { FactoryGirl.create(:classroom) }
      let!(:service) { FactoryGirl.create(:service) }
      let!(:children) do
        20.times { FactoryGirl.create(:child, :classroom => classroom ) } 
      end
      let!(:attendance) { FactoryGirl.create(:attendance, 
                                             :service => service,
                                             :classroom => classroom,
                                             :child => Child.first) }

      it "reduces the attendance count" do
        expect do
          page.driver.post('/undoCheckin', 
            { 
              :service_id => 1, 
              :classroom_id => 1, 
              :child_id => Child.first.id 
            }
          )
        end.should change(Attendance, :count).by(-1)
      end
    end

  end

  describe "admin tab" do
    describe "when not an admin" do
      let(:non_admin) { FactoryGirl.create(:volunteer, :admin => false) }
      before { sign_in(non_admin) }
      it { should_not have_selector('a', :text => 'admin') } 
    end

    describe "when an admin" do
      before { sign_in(volunteer) }
      it { should have_selector('a', :text => 'admin') }
    end

  end
end

