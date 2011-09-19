class VolunteersController < ApplicationController
  before_filter :authenticate_volunteer!

  def index
    @volunteers = Volunteer.all

    respond_to do |format|
      format.html
    end
  end

end
