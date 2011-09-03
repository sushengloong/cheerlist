class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /friendships
  # GET /friendships.xml
  #def index
  #  @friendships = user.friendships.all

  #  respond_to do |format|
  #    format.html # index.html.erb
  #   format.xml  { render :xml => @friendships }
  #  end
  #end

  # GET /friendships/1
  # GET /friendships/1.xml
  #def show
  #  @friendship = user.friendships.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @friendship }
  #  end
  #end

  # GET /friendships/new
  # GET /friendships/new.xml
  #def new
  #  @friendship = Friendship.new

  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.xml  { render :xml => @friendship }
  #  end
  #end

  # GET /friendships/1/edit
  #def edit
  #  @friendship = Friendship.find(params[:id])
  #end

  # POST /friendships
  # POST /friendships.xml
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to(profile_url(params[:friend_id]), :via => :get, :notice => 'Befriended successfully.') }
        format.xml  { render :xml => @friendship, :status => :created, :location => @friendship }
      else
        format.html { redirect_to(profile_url(params[:friend_id]), :via => :get, :alert => 'Failed to befriend.') }
        format.xml  { render :xml => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friendships/1
  # PUT /friendships/1.xml
  #def update
  #  @friendship = Friendship.find(params[:id])

  #  respond_to do |format|
  #    if @friendship.update_attributes(params[:friendship])
  #      format.html { redirect_to(@friendship, :notice => 'Friendship was successfully updated.') }
  #      format.xml  { head :ok }
  #    else
  #      format.html { render :action => "edit" }
  #      format.xml  { render :xml => @friendship.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /friendships/1
  # DELETE /friendships/1.xml
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to(friendships_url, :notice => "Unfriended successfully.") }
      format.xml  { head :ok }
    end
  end
end
