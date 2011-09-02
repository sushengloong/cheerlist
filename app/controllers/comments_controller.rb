class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @game = Game.find(params[:game_id])
    @comment = Comment.build_from(@game, current_user.id, params[:comment][:body])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@game, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { redirect_to(@game, :alert => 'Comment addition failed!') }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @game = Comment.find_commentable("Game", @comment.commentable_id)
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@game, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(@game, :alert => 'Failed to edit comment!') }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @game = Comment.find_commentable("Game", @comment.commentable_id)
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(@game, :notice => 'Comment was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
