class HomeController < ApplicationController
  before_filter :authenticate_volunteer!

  def index
    if (params.empty? == false)
      classroom_id = params[:class_id]
      service_id = params[:service_id]
      
      if classroom_id.nil? == false && service_id.nil? == false
        @children = Child.where(:classroom_id => classroom_id).order(:first_name, :last_name)

        @existing_attendance_children = Attendance.where(
          :classroom_id => classroom_id,
          :service_id => service_id
          ).map { |a| a[:child_id] }
      end
      @selected_class = classroom_id unless classroom_id.nil?
      @selected_service = service_id unless service_id.nil?
    end

    @services = Service.where('service_date >= ?', Date.today)
    @classrooms = Classroom.where("classrooms.name <> ?", 'All').order(:id)

    respond_to do |format|
      response.headers['Cache-Control'] = 'no-cache';
      format.html # home/index.html.haml
    end
  end

  def processCheckin
    service_id = params[:service_id]
    classroom_id = params[:classroom_id] 
    child_id = params[:child_id]

    if service_id.nil? || classroom_id.nil? || child_id.nil? ||
        service_id.empty? || classroom_id.empty? || child_id.empty?
      render :text => 'All fields required to process a checkin'
    else
      a = Attendance.new
      a.service_id = service_id
      a.classroom_id = classroom_id
      a.child_id = child_id

      response.headers['Cache-Control'] = 'no-cache';
      if a.save
        render :text => 'OK'
      else
        render :text => 'There were errors: #{ a.errors.to_a.join(", ")}'
      end
    end
    
  end

  def undoCheckin
    service_id = params[:service_id]
    classroom_id = params[:classroom_id] 
    child_id = params[:child_id]

    response.headers['Cache-Control'] = 'no-cache';

    if service_id.nil? || classroom_id.nil? || child_id.nil? ||
        service_id.empty? || classroom_id.empty? || child_id.empty?
      render :text => 'All fields required to process a checkin'
    else
      begin
        a = Attendance.where(
          :service_id => service_id,
          :classroom_id => classroom_id,
          :child_id => child_id
        )[0]

        a.destroy
        render :text => 'OK'
      rescue
        render :text => 'There were errors: #{ a.errors.to_a.join(", ")}'
      end
    end
  end
end
