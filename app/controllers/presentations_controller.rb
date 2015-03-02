class PresentationsController < ApplicationController
  def show
    @presentation = current_user.presentation ||
                      Presentation.new(user: current_user)
  end

  def create
    @presentation = Presentation.new(user: current_user)

    update_presentation
  end

  def update
    @presentation = current_user.presentation

    update_presentation
  end

  private

  def update_presentation
    if @presentation.update_attributes(presentation_params)
      redirect_to presentation_path, notice: I18n.t('presentation.saved')
    else
      flash.now[:alert] = I18n.t('presentation.errors')
      render action: 'show'
    end
  end

  def presentation_params
    params.require(:presentation).permit(:title, :abstract, :keywords)
  end
end