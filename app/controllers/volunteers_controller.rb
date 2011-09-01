class VolunteersController < ApplicationController
  def index
    @volunteers = Volunteer.all

    respond_to do |format|
      format.html
    end
  end

end
