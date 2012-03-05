module HomeHelper
  def is_admin?
    if current_volunteer
      current_volunteer.is_admin?
    else
      false
    end
  end
end
