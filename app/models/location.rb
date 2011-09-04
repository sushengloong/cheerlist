class Location < ActiveRecord::Base
  belongs_to :country
  has_many :check_ins
  
  geocoded_by :address
  geocoded_by :ip_address
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      
      logger.debug "[$GEO$] #{geo.data.inspect}"
      obj.address     = geo.address
      obj.city        = geo.city
      obj.state       = geo.state
      obj.postal_code = geo.postal_code
      country = Country.find_by_name(geo.country)
      obj.country_id  = (country.id unless country.nil?) ||
                          Country.find_by_name("Malaysia").id
    end
  end
  
  after_validation :geocode, :reverse_geocode
end
