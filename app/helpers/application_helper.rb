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

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end


end
