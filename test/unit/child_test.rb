require 'test_helper'

class ChildTest < ActiveSupport::TestCase
end
# == Schema Information
#
# Table name: children
#
#  id           :integer         not null, primary key
#  first_name   :string(255)
#  last_name    :string(255)
#  birthday     :date
#  classroom_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  notes        :text
#  inactive     :boolean         default(FALSE)
#

