class Classroom < ActiveRecord::Base
  has_many :children
  belongs_to :attendance
end
