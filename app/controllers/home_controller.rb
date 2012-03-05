class HomeController < ApplicationController
  before_filter :authenticate_volunteer!

  def index
    unless (params.empty?)
      classroom_id = params[:class_id]
      service_id = params[:service_id]
      
      unless classroom_id.nil? || service_id.nil?
        if classroom_id.to_i == Classroom.find_by_name('All').id
          @children = Child.all
          @existing_attendance_children = Service.find(service_id).
            attendances.
            map { |c| c.child_id }
        else
          @children = Child.where(:classroom_id => classroom_id)
          @existing_attendance_children = Service.find(service_id).
            attendances.
            select { |a| a.classroom_id == classroom_id.to_i }.
            map { |c| c.child_id }
        end
      end
      @selected_class = classroom_id unless classroom_id.nil?
      @selected_service = service_id unless service_id.nil?
    end

    @services = Service.all.sort_by { |s| s.service_date }
    @classrooms = Classroom.all

    respond_to do |format|
      response.headers['Cache-Control'] = 'no-cache';
      format.html # home/index.html.haml
    end
  end

  def processCheckin
    service_id = params[:service_id]
    classroom_id = params[:classroom_id] 
    child_id = params[:child_id]

    unless service_id.nil? || classroom_id.nil? || child_id.nil? 
      classroom = Classroom.find(classroom_id)
      child = Child.find(child_id)
      service = Service.find(service_id)

      a = service.attendances.build(
        :classroom => classroom,
        :child => child
      )

      response.headers['Cache-Control'] = 'no-cache';
      if a.save
        render :text => 'OK'
      else
        render :text => 'There were errors: #{ a.errors.to_a.join(", ")}'
      end
    else
      render :text => 'All fields required to process a checkin'
    end
  end

  def undoCheckin
    service_id = params[:service_id]
    classroom_id = params[:classroom_id] 
    child_id = params[:child_id]

    response.headers['Cache-Control'] = 'no-cache';

    unless service_id.nil? || classroom_id.nil? || child_id.nil?
      begin
        Service.find(service_id).attendances.select do |attendance|
          attendance.classroom_id == classroom_id.to_i and 
          attendance.child_id == child_id.to_i
        end.first.destroy

        render :text => 'OK'
      rescue Exception => ex
        puts ex
        render :text => 'There were errors: #{ a.errors.to_a.join(", ")}'
      end
    else
      render :text => 'All fields required to process a checkin'
    end
  end
end
