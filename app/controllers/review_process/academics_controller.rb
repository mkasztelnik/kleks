module ReviewProcess
  class AcademicsController < ReviewProcess::ApplicationController
    def show
      @educations = @review.educations
    end

    private

    def update_params
      params.require(:review).permit(:academic_score)
    end
  end
end
