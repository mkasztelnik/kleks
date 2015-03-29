module ReviewProcess
  class EducationsController < ReviewProcess::ApplicationController
    def show
      @educations = @review.educations
    end

    private

    def update_params
      params.require(:review).permit(:education_score)
    end
  end
end
