class GamesController < ApplicationController
  def index
    @games = Game.order(:time).page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end
  
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
  
  def search
    @search = Game.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 5
    end
    #@games = @search.results
  end
end