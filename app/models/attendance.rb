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
class Attendance < ActiveRecord::Base
#  has_one :service
#  has_one :classroom
#  has_one :child

  validates_presence_of :service_id, :classroom_id, :child_id

  #
  # A query useful for counting attendances for each 
  # weekend. Brings back a list of objects for the date
  # range
  # {
  #   :service_date,
  #   :count
  # }
  def self.attendance_totals(start_date, end_date)
    select("date_trunc('day', services.service_date) as service_date, COUNT(service_id)").
    joins("RIGHT OUTER JOIN services ON attendances.service_id = services.id INNER JOIN children ON children.id = attendances.child_id").
    where('services.service_date' => start_date..end_date, 'children.inactive' => false).
    group("date_trunc('day', services.service_date)").
    order("date_trunc('day', services.service_date)")
  end
end
