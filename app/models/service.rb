class Service < ActiveRecord::Base
  def to_s
    service_date.strftime("%A %I:%M %p -%m/%d/%y")  
  end
  
  def admin_label
    to_s 
  end
end
