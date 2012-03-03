class Classroom < ActiveRecord::Base
  default_scope :conditions => {:active => true }

  has_many :children
  has_many :volunteers

  def to_s
    self[:name]
  end

  def admin_label
    self[:name]
  end

  def active?
    active
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

