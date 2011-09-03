class Child < ActiveRecord::Base
  has_and_belongs_to_many :parents
  belongs_to :classroom

  def to_s
    "#{ first_name } #{ last_name }"    
  end
end