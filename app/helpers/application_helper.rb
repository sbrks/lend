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

  def validate_user
    redirect_to root_path unless current_user.id.to_s == params[:id]
  end


end
