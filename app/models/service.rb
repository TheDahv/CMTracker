class Service < ActiveRecord::Base
  has_many :attendances
  # Not ready to go yet
  # has_many :checked_in_kids, :through => Attendance, :source => :child

  def to_s
    service_date.strftime("%A %I:%M %p -%m/%d/%y")  
  end
  
  def admin_label
    to_s 
  end
end
# == Schema Information
#
# Table name: services
#
#  id           :integer         not null, primary key
#  service_date :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

