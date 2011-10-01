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
