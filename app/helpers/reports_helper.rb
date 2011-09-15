module ReportsHelper
  def reconstruct_from_date_select(field_name, params)
    Date.new(
      params["#{field_name.to_s}(1i)"].to_i,
      params["#{field_name.to_s}(2i)"].to_i,
      params["#{field_name.to_s}(3i)"].to_i
    )
  end
end
