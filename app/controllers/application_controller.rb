class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_for_mobile

  private

  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end

  def prepare_for_mobile
    request.format = :mobile if mobile_device?
  end
end
