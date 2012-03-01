require 'spec_helper'

describe Attendance do
  it { should respond_to(:service_id) } 
  it { should respond_to(:classroom_id) } 
  it { should respond_to(:child_id) } 

  it { should respond_to(:service) } 
  it { should respond_to(:classroom) } 
  it { should respond_to(:child) } 
end
