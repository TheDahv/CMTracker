require 'test_helper'

class ParentTest < ActiveSupport::TestCase
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

