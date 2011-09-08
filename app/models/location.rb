class Location < ActiveRecord::Base
  belongs_to :country
  has_many :check_ins
  
  acts_as_gmappable :process_geocoding => false
  #geocoded_by :address
  #geocoded_by :ip_address
  #reverse_geocoded_by :latitude, :longitude do |obj,results|
  #  if geo = results.first
      
  #    logger.debug "[$GEO$] #{geo.data.inspect}"
  #    obj.address     = geo.address
  #    obj.city        = geo.city
  #    obj.state       = geo.state
  #    obj.postal_code = geo.postal_code
  #    country = Country.find_by_name(geo.country)
  #    obj.country_id  = (country.id unless country.nil?) ||
                          Country.find_by_name("Malaysia").id
  #  end
  #end
  
  def gmaps4rails_address
    "#{self.street}, #{self.city}, #{self.country}"
  end
  
  # after_validation :geocode, :reverse_geocode
  validates :name, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :country_id, :presence => true
  validates :latitude, :presence => true
  validates :longitude, :presence => true
end
