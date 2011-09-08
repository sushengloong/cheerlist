class PagesController < ApplicationController
  def index
    #ip = Rails.env.production? ? request.ip : "60.48.210.169"
    #@location = Location.new(:ip_address => ip)
    #@location.geocode
    #@location.reverse_geocode
    @location = Location.new(:latitude => 1.46343, :longitude => 103.7547149)
    @json = @location.to_gmaps4rails
  end
  
  def about
    
  end
end
