module ReviewProcess
  class PresentationsController < ReviewProcess::ApplicationController
    def show
      @presentation = @review.presentation
    end

    private

    def update_params
      params.require(:review).permit(:presentation_score)
    end
  end
end
