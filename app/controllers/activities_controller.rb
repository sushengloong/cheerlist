class ActivitiesController < ApplicationController
  def index
    @activities = Activity.where("created_at > ?", 
                    Time.at(params[:after].to_i + 1))
  end
end
