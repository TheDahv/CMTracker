class ReportsController < ApplicationController
  layout :choose_layout
  before_filter :authenticate_volunteer!

  def index
    @report_paths = ['attendances', 'roster']

    respond_to do |format|
      format.html
    end
  end

  def attendances
    if params.empty? == false
      class_id = params[:class_id]
      start_date = Date.strptime(params[:start_date], "%m/%d/%Y") unless params[:start_date].nil?
      end_date = Date.strptime(params[:end_date], "%m/%d/%Y") unless params[:end_date].nil?

      unless class_id.nil? || start_date.nil? || end_date.nil? 
        if class_id.to_i == 5
          # Return attendances from all classes
          @attendances = Attendance.select("date_trunc('day', services.service_date) as service_date, COUNT(service_id)").
            joins("RIGHT OUTER JOIN services ON attendances.service_id = services.id INNER JOIN children ON children.id = attendances.child_id").
            where('services.service_date' => start_date..end_date, 'children.inactive' => false).
            group("date_trunc('day', services.service_date)").
            order("date_trunc('day', services.service_date)")
        else
          @attendances = Attendance.select("date_trunc('day', services.service_date) as service_date, COUNT(service_id)").
            joins('RIGHT OUTER JOIN services ON attendances.service_id = services.id INNER JOIN children ON children.id = attendances.child_id').
            where('services.service_date' => start_date..end_date, :classroom_id => class_id, 'children.inactive' => false).
            group("date_trunc('day', services.service_date)").
            order("date_trunc('day', services.service_date)")
        end

        # Turn all count values back into numbers and dates into dates
        @attendances.each do |a| 
          a.service_date = a.service_date.to_date
          a.count = a.count.to_i
        end

        # Add Saturday attendance values to Sunday values
        @attendances.each_with_index do |a, i|
          if a.service_date.wday == 6 
            # if this day is Saturday, add the count to Sunday
            @attendances[i + 1].count += a.count if ((i + 1) < (@attendances.length))
          end
        end

        # Filter out the Saturdays
        @attendances = @attendances.select { |a| a.service_date.wday != 6 }
        
        @h = HighChart.new('graph') do |f| 
          f.title({:text => 'Attendances'})
          f.chart(
            :margin => [30, 20, 40, 20],
            :type => 'line'
          )

          f.x_axis(
            :categories => @attendances.map { |a| a.service_date.strftime("%m/%d/%Y") },
            :labels => { :rotation => 90 } 
          )

          f.y_axis(
            :min => 0,
            :max => 80
          )
         
          f.series(
            :name => 'Attendances', 
            :data => @attendances.map { |a| [a.service_date.strftime("%m/%d/%Y"), a.count ] } 
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

  def roster
    @classrooms = Classroom.where('name <> ?', 'All').order(:id)

    respond_to do |format|
      format.html
    end
  end
  
  def roster_printout
    unless params[:classroom_id].nil?
      classroom_id = params[:classroom_id]

      @children = Child.where("classroom_id = ? AND inactive = ?", classroom_id, false).order(:first_name, :last_name)
      @classroom_name = Classroom.find(classroom_id).name
    end

    respond_to do |format|
      format.html
    end
  end

  private
  def choose_layout
    if action_name == 'roster_printout'
      'roster_printout'
    else
      'application'
    end
  end

end
