class DTCMAttendanceImporter < ActiveRecord::Base
  def initialize(file, class_id)
    unless file.respond_to?('readline')
      raise ArgumentError, "Must pass a File object"
    end

    @file = file
    @class_id = class_id
  end

  def parse_file
    header_line = @file.readline.split(',')
    
    dates = header_line[2..header_line.length-1].map { |d| Date.strptime(d, "%Y/%m/%d") }

    @file.each do |line|
      l = line.split(',')
      name = l.shift
      fname = name.gsub('"', '').split(' ')[0].strip
      lname = name.gsub('"', '').split(' ')[1].strip

      bday_string = l.shift
      bday = bday_string.empty? ? nil : Date.strptime(bday_string, "%Y/%m/%d")

      children = Child.where(:first_name => fname, :last_name => lname)
      if children.count == 0
        # Create a new child record
        child = Child.create(
          :first_name => fname,
          :last_name => lname,
          :birthday => bday,
          :classroom_id => @class_id.to_i
        )
      else
        child = children[0]
      end

      l.zip(dates).each do |attendance|
        if attendance[0] == '1'
          puts "Record attendance for #{ name } on #{ attendance[1] } whose birthday is #{ bday }"
          att_date = attendance[1]
          target_date = DateTime.civil(att_date.year, att_date.month, att_date.day, 9)
          service = Service.where(:service_date => target_date)[0]

          Attendance.create(
            :classroom_id => @class_id.to_i,
            :child_id => child.id,
            :service_id => service.id
          )
        end
      end
    end
  end
end
