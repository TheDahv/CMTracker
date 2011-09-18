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
          @attendances = Attendance.select("services.service_date, COUNT(service_id)").
            joins("RIGHT OUTER JOIN services ON attendances.service_id = services.id").
            where('services.service_date' => start_date..end_date).
            group('services.service_date').
            order('services.service_date')
        else
          @attendances = Attendance.select('services.service_date, COUNT(service_id)').
            joins('RIGHT OUTER JOIN services ON attendances.service_id = services.id').
            where('services.service_date' => start_date..end_date, :classroom_id => class_id).
            group('services.service_date').
            order('services.service_date')
        end
        @h = HighChart.new('graph') do |f| 
          f.title({:text => 'Attendances'})
          f.chart(
            :margin => [30, 20, 40, 20],
            :type => 'line'
          )

          f.x_axis(
            :categories => @attendances.map { |a| a.service_date }, #.strftime("%m/%d/%Y") },
            :labels => { :rotation => 90 } 
          )

          f.y_axis(
            :min => 0
          )
         
          f.series(
            :name => 'Attendances', 
            :data => @attendances.map { |a| [a.service_date, a.count ] } #.strftime("%m/%d/%Y"), a.count] }
          )
        end 

        @selected_class = class_id
        @start_date = start_date.strftime("%m/%d/%Y")
        @end_date = end_date.strftime("%m/%d/%Y")
       end

   end

    @services = Service.all
    @classrooms = Classroom.all

    respond_to do |format|
      format.html
    end
  end

end
