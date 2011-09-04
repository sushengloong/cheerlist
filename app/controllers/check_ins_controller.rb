class CheckInsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    @check_ins = CheckIn.find_by_user_id(params[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @check_ins }
    end
  end

  def new
    ip = Rails.env.production? ? request.ip : "60.48.210.169"
    @location = Location.new(:ip_address => ip)
    @location.geocode
    @location.reverse_geocode
    @json = @location.to_gmaps4rails
    @game = Game.find(params[:game_id])
    if @game.nil?
      redirect_to games_url, :alert => "No such game found!"
    end
    @check_in = CheckIn.new
  end
  
  def create
    if current_user.has_checked_in? params[:game_id]
      redirect_to games_url, :alert => "You've already checked in the game!"
    else
      if CheckIn.create! :user_id => current_user.id, :game_id => params[:game_id]
        redirect_to games_url, :notice => "You've checked in the game successfully"
      else
        redirect_to games_url, :alert => "Cannot check in the game!"
      end
    end
  end
end
