class Child < ActiveRecord::Base
  has_and_belongs_to_many :parents
  belongs_to :classroom
  has_many :attendances

  attr_reader :age, :first_day, :most_recent_day

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

  # Returns the first recorded attendance date for this child
  def first_day
    if self.attendances.any? 
      Service.find(self.attendances.map {|a| a.service_id }).min_by { |s| s.service_date }.service_date.to_date
    else
      nil
    end
  end

  # Returns the most recently recorded attendance date for this child
  def most_recent_day
    if self.attendances.any? 
      Service.find(self.attendances.map { |a| a.service_id }).max_by { |s| s.service_date }.service_date.to_date
    else
      nil
    end
  end
end
