class Classroom < ActiveRecord::Base
  has_many :children
  has_many :volunteers
  belongs_to :attendance
end
