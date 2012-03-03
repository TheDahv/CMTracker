require 'spec_helper'

describe Attendance do
  it { should respond_to(:service_id) } 
  it { should respond_to(:classroom_id) } 
  it { should respond_to(:child_id) } 

  it { should respond_to(:service) } 
  it { should respond_to(:classroom) } 
  it { should respond_to(:child) } 
end
# == Schema Information
#
# Table name: attendances
#
#  id           :integer         not null, primary key
#  service_id   :integer
#  classroom_id :integer
#  child_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

