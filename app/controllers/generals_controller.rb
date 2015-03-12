class GeneralsController < ApplicationController
  def show
    @general = current_user.general || General.new(user: current_user)
  end

  def create
    @general = General.new(user: current_user)

    update_general
  end

  def update
    @general = current_user.general

    update_general
  end

  private

  def update_general
    if @general.update_attributes(general_params)
      redirect_to general_path, notice: I18n.t('general.saved')
    else
      flash.now[:alert] = I18n.t('general.errors')
      render action: 'show'
    end
  end

  def general_params
    params.require(:general).
      permit(:accept, :accept_travel, :accept_insurance,
             :know_from_ces_www, :know_from_ces_facebook,
             :know_from_facebook, :know_from_newsletter,
             :know_from_leaflet, :know_from_friends,
             :other_websites, :other)
  end
end
