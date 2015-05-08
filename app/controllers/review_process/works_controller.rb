module ReviewProcess
  class WorksController < ReviewProcess::ApplicationController
    def show
      @works = @review.works
    end

    private

    def update_params
      params.require(:review).permit(:work_score)
    end
  end
end
