class Checkin < ActiveRecord::Base
  has_one :child
  has_one :volunteer
  has_one :classroom
  has_one :service
end
