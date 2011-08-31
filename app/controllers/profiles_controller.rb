class ProfilesController < ApplicationController

  before_filter :authenticate_user!, :except => [:show]
  before_filter :check_user, :except => [:show]
  
  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = Profile.find_by_user_id(params[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find_by_user_id(params[:user_id])
    @teams = Team.all
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = Profile.find_by_user_id(params[:user_id])
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

private
  def check_user
    if current_user.id.to_s == params[:user_id]
      return true
    else
      redirect_to profile_url, :alert => "Unauthorised access!";
      return false
    end
  end
  
end
