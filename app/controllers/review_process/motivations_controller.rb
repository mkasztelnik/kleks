module ReviewProcess
  class MotivationsController < ReviewProcess::ApplicationController
    def show
      @motivation = @review.motivation
    end

    private

    def update_params
      params.require(:review).permit(:motivation_score)
    end
  end
end
