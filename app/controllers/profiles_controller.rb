class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile ||
                Profile.new(user: current_user).tap { |p| p.build_address }
  end

  def create
    @profile = Profile.new(user: current_user)

    update_profile
  end

  def update
    @profile = current_user.profile

    update_profile
  end

  private

  def update_profile
    if @profile.update_attributes(profile_params)
      redirect_to profile_path, notice: I18n.t('profile.saved')
    else
      flash.now[:alert] = I18n.t('profile.errors')
      render action: 'show'
    end
  end

  def profile_params
    params.require(:profile).
      permit(:first_name, :last_name, :middle_name, :gender,
             :date_of_birth, :place_of_birth, :citizenship, :country,
             :passport_number, :passport_date_of_issue,
             :passport_place_of_issue, :passport_issuing_agency,
             address_attributes: [
                :address, :city,
                :country, :state, :postcode
             ])
  end
end