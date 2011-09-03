class Parent < ActiveRecord::Base
  has_and_belongs_to_many :children

  def to_s
    "#{ first_name } #{ last_name }"
  end
end