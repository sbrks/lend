module ApplicationHelper

	def location
  if params[:location].blank?
    if Rails.env.test? || Rails.env.development?
      @location ||= Geocoder.search("50.78.167.161").first
    else
      @location ||= request.location
    end
  else
    params[:location].each {|l| l = l.to_i } if params[:location].is_a? Array
    @location ||= Geocoder.search(params[:location]).first
    @location
  end
end

  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-success"
      when :info then "alert alert-info"
      when :alert then "alert alert-danger"
      when :warning then "alert alert-warning"
    end
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end


end
