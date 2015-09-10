class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find params[:id]
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find params[:id]
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profiles_path
    else
      render :new
      flash[:notice] = "Profile not created"
    end
  end

  def update
    @profile = Profile.find params[:id]
    @profile.update(profile_params)

    if @profile.save
      redirect_to profiles_path
    else
      render :edit
    end
  end

  def destroy
    @profile = Profile.find params[:id]
    @profile.destroy
    redirect_to profiles_path
  end

private

  def profile_params
    params.require(:profile).permit!
  end
end
