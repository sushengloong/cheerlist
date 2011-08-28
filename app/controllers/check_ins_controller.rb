class CheckInsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  # GET /check_ins
  # GET /check_ins.xml
  def index
    @check_ins = CheckIn.find_by_user_id(params[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @check_ins }
    end
  end

  # GET /check_ins/new
  # GET /check_ins/new.xml
  def new
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
