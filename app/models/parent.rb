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
# == Schema Information
#
# Table name: parents
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  notes      :text
#  inactive   :boolean         default(FALSE)
#  onthecity  :boolean
#  visitor    :boolean         default(FALSE)
#

