class LanguagesController < ApplicationController
  def show
    @language = current_user.language || Language.new(user: current_user)
  end

  def create
    @language = Language.new(user: current_user)

    update_language
  end

  def update
    @language = current_user.language

    update_language
  end

  private

  def update_language
    if @language.update_attributes(language_params)
      redirect_to language_path, notice: I18n.t('language.saved')
    else
      flash.now[:alert] = I18n.t('language.errors')
      render action: 'show'
    end
  end

  def language_params
    params.require(:language).permit(:text)
  end
end