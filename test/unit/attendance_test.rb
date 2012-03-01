require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "cannot save a blank attendance" do
    a = Attendance.new
    a = a.save
    assert a == false
  end
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

