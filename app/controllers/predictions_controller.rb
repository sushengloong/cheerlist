class PredictionsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @game = Game.find(params[:game_id])
    @prediction = @game.predictions.build(params[:prediction])
    @prediction.user = current_user
    respond_to do |format|
      if @prediction.save
        format.html { redirect_to(@game, :notice => 'Prediction was successfully created.') }
        format.xml  { render :xml => @prediction, :status => :created, :location => @prediction }
      else
        format.html { redirect_to(@game, :alert => 'Failed to created prediction.') }
        format.xml  { render :xml => @prediction.errors, :status => :unprocessable_entity }
      end
    end
  end
end
