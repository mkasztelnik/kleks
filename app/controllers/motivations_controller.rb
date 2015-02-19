class MotivationsController < ApplicationController
  def show
    @motivation = current_user.motivation || Motivation.new(user: current_user)
  end

  def create
    @motivation = Motivation.new(user: current_user)

    update_motivation
  end

  def update
    @motivation = current_user.motivation

    update_motivation
  end

  private

  def update_motivation
    if @motivation.update_attributes(motivation_params)
      redirect_to motivation_path, notice: I18n.t('motivation.saved')
    else
      flash.now[:alert] = I18n.t('motivation.errors')
      render action: 'show'
    end
  end

  def motivation_params
    params.require(:motivation).permit(:text)
  end
end