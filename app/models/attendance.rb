class Attendance < ActiveRecord::Base
  has_one :service
  has_one :classroom
  has_one :child

  validates_presence_of :service_id, :classroom_id, :child_id
end
