class ProfilesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :profile_not_found

  before_action :set_profile, only: [:update]

  def show
    @profile = Profile.first
    if @profile.nil?
      render plain: "No profile found", status: :not_found
    end
  end

  def update
    puts params[:profile][:avatar] # Debug
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :show # or :edit, depending on your desired behavior
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :title, :bio, :skills, :social_links, :avatar)
  end

  def profile_not_found
    flash[:alert] = "Profile not found."
    redirect_to root_path
  end
end
