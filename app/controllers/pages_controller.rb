class PagesController < ApplicationController
  def index
    ip = Rails.env.production? ? request.ip : "60.48.210.169"
    @location = Location.new(:ip_address => ip)
    @location.geocode
    @location.reverse_geocode
    @json = @location.to_gmaps4rails
  end
  
  def about
    
  end
end
