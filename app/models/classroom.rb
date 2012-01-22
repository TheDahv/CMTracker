class Classroom < ActiveRecord::Base
  # Properties
  # name - string: The display name of the classroom
  # created/updated_at - DateTime

  has_many :children
  has_many :volunteers

  def to_s
    self[:name]
  end

  def admin_label
    self[:name]
  end
  
end
