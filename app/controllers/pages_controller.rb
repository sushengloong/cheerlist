class PagesController < ApplicationController
  def index
    #ip = Rails.env.production? ? request.ip : "60.48.210.169"
    #@location = Location.new(:ip_address => ip)
    #@location.geocode
    #@location.reverse_geocode
    @locations = Location.all
    @json = @locations.to_gmaps4rails
    @activities = Activity.order("created_at").limit(20)
  end
  
  def about
    
  end
end
