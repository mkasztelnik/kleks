module ReviewProcess
  class ApplicationController < ::ApplicationController
    layout 'review'
    load_and_authorize_resource :review

    def update
      if @review.update_attributes(update_params)
        redirect_to :back,
                    notice: I18n.t('score.saved')
      else
        flash.now[:alert] = I18n.t('score.error')
        render action: 'index'
      end
    end
  end
end