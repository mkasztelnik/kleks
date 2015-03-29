module ReviewProcess
  class LanguagesController < ReviewProcess::ApplicationController
    def show
      @language = @review.language
    end

    private

    def update_params
      params.require(:review).permit(:language_score)
    end
  end
end
