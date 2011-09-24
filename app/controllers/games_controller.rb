class GamesController < ApplicationController
  autocomplete :team, :name
  before_filter :authenticate_user!, :only => [:thumbs_up, :thumbs_down]
  
  def index
    game_date = params[:date].blank? ? Time.now : Date.parse(params[:date])
    @games = Game.where("date(time) = date(?)", game_date)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end
  
  def show
    @game = Game.find(params[:id])
    #@json = @game.check_ins.first.location.to_gmaps4rails if @game.check_ins.count > 0
    @locations = @game.check_ins.map do |check_in|
      check_in.location
    end

    @json = @locations.blank? ? [] : @locations.to_gmaps4rails
    
    unless current_user.blank?
      @comment = Comment.build_from(@game, current_user.id, "")
    end
    @prediction = Prediction.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end
  
  def leaderboard
    @users = User.includes(:profile).order("profiles.points DESC").page(params[:page]).per(10)
    respond_to do |format|
      format.html # leaderboard.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def search
    @search = Game.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 10
      order_by :time, :desc
    end
  end
  
  def thumbs_up
    @game = Game.find(params[:id])
    if current_user.voted_on? @game
      redirect_to @game, :alert => "You've already voted for the game!"
    else
      current_user.vote_for(@game)
      redirect_to @game, :notice => "Thanks for voting for the game!"
    end
  end
  
  def thumbs_down
    @game = Game.find(params[:id])
    if current_user.voted_on? @game
      redirect_to @game, :alert => "You've already voted for the game!"
    else
      current_user.vote_against(@game)
      redirect_to @game, :notice => "You've voted against the game!"
    end
  end
end