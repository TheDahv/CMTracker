class ReportsController < ApplicationController
  def index
    @report_paths = ['attendances']

    respond_to do |format|
      format.html
    end
  end

  def attendances
    if params.empty? == false
      class_id = params[:class_id]
      start_date = Date.parse(params[:start_date]) unless params[:start_date].nil?
      end_date = Date.parse(params[:end_date]) unless params[:end_date].nil?

      unless class_id.nil? || start_date.nil? || end_date.nil? 
        if class_id.to_i == 5
          # Return attendances from all classes
          puts "Attendances from all classes"
          @attendances = Service.select("services.service_date, COUNT(services.service_date)").
            joins("LEFT OUTER JOIN attendances ON services.id = attendances.service_id").
            where({
              :service_date => start_date..end_date
            }).
            group("services.service_date")
        else
          puts "Attendance from a specific class"
          @attendances = Service.select("services.service_date, COUNT(services.service_date)").
            joins("LEFT OUTER JOIN attendances ON services.id = attendances.service_id").
            where({
              :service_date => start_date..end_date,
              "attendances.classroom_id" => class_id
            }).
            group("services.service_date")
        end
        puts @attendances
        # @children = Hash[Child.find(@attendances.map { |a| a.child_id }.uniq).map { |c| [c.id, c] }]

        @selected_class = class_id
       end

   end

    @services = Service.all
    @classrooms = Classroom.all

    respond_to do |format|
      format.html
    end
  end

end
