class Parent < ActiveRecord::Base
  # Properties
  # first_name - String
  # last_name - String
  # email - String
  # phone - String
  # notes - String: Any notes useful to service lead about the family
  # inactive - boolean: Used to mark families that don't attend MHDT anymore
  # onthecity - boolean: Used to mark families that are on The City
  # visitor - boolean: Used to mark families that are one-time visitors
  has_and_belongs_to_many :children

  def to_s
    "#{ first_name } #{ last_name }"
  end

  def admin_label
    to_s
  end
end
