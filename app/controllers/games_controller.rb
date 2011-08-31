class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])
    unless current_user.blank?
      @comment = Comment.build_from(@game, current_user.id, "")
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end
  
  def leaderboard
    @users = User.leaders
    respond_to do |format|
      format.html # leaderboard.html.erb
      format.xml  { render :xml => @users }
    end
  end
end