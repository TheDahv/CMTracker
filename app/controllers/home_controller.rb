class HomeController < ApplicationController
  def index
    if (params.empty? == false)
      puts params[:class_id]
      puts params[:service_id]

      @children = Classroom.find(params[:class_id]).children 
      @selected_class = params[:class_id]
    end

    @services = Service.where('service_date >= ?', Date.today)
    @classrooms = Classroom.all
    @classrooms.pop # get rid of :all classroom

    respond_to do |format|
      format.html # home/index.html.haml
    end
  end
end
