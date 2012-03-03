require 'spec_helper'

describe Classroom do
  it { should respond_to(:name) }
  it { should respond_to(:active) }

  describe "only active by default" do
    before { seed }

    Classroom.all.each do |classroom|
      subject { classroom }
      it { should be_active }
    end

    it "and excludes inactive class" do
      classes = Classroom.all
      inactive = Classroom.find_by_name('Inactive')
      expect { classes.include?(inactive) == false }
    end
  end
end
# == Schema Information
#
# Table name: classrooms
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  active     :boolean
#

