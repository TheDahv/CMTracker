class HomeController < ApplicationController
  before_filter :authenticate_volunteer!
  def index
    if (params.empty? == false)
      classroom_id = params[:class_id]
      service_id = params[:service_id]
      
      if classroom_id.nil? == false && service_id.nil? == false
        # There needs to be a way to parameterize this
        @children = Child.where(:classroom_id => classroom_id)
      end
      @selected_class = classroom_id unless classroom_id.nil?
      @selected_service = service_id unless service_id.nil?
    end

    @services = Service.where('service_date >= ?', Date.today)
    @classrooms = Classroom.all
    @classrooms.pop # get rid of :all classroom

    respond_to do |format|
      format.html # home/index.html.haml
    end
  end

  def processCheckin
    puts params
    service_id = params[:service_id]
    classroom_id = params[:classroom_id] 
    child_id = params[:child_id]

    if service_id.nil? || classroom_id.nil? || child_id.nil? 
      render :text => 'All fields required to process a checkin'
    else
      a = Attendance.new({
        :service_id => service_id,
        :classroom_id => classroom_id,
        :child_id => child_id
      }) 

      if a.save
        render :text => 'OK'
      else
        render :text => 'There were errors: #{ a.errors.to_a.join(", ")}'
      end
    end
    
  end
end
