class Child < ActiveRecord::Base
  has_and_belongs_to_many :parents
  belongs_to :classroom
  has_many :attendances

  attr_reader :age

  def to_s
    "#{ first_name } #{ last_name }"    
  end

  def admin_label
    to_s
  end

  def age
    return 0 if self.birthday == nil

    dob = self.birthday
    now = Time.now.utc.to_date

    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
