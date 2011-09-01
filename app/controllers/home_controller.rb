class HomeController < ApplicationController
  def index
    if (params.empty? == false)
      puts params[:class_id]
      puts params[:service_id]

      @children = Classroom.find(params[:class_id]).children unless params[:class_id].nil? 
      @selected_class = params[:class_id] unless params[:class_id].nil?
    end

    @services = Service.where('service_date >= ?', Date.today)
    @classrooms = Classroom.all
    @classrooms.pop # get rid of :all classroom

    respond_to do |format|
      format.html # home/index.html.haml
    end
  end
end
