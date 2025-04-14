class ProfilesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :profile_not_found

  def show
    @profile = Profile.first
    if @profile.nil?
      render plain: "No profile found", status: :not_found
    end
  end

  private

  def profile_not_found
    flash[:alert] = "Profile not found."
    redirect_to root_path
  end
end
