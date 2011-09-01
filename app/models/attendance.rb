class Attendance < ActiveRecord::Base
  has_one :service
  has_one :classroom
  has_one :child
end
