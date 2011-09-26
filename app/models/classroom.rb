class Classroom < ActiveRecord::Base
  has_many :children
  has_many :volunteers

  def to_s
    self[:name]
  end

  def admin_label
    self[:name]
  end
  
end
