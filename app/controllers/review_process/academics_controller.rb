module ReviewProcess
  class AcademicsController < ReviewProcess::ApplicationController
    def show
    end

    private

    def update_params
      params.require(:review).permit(:academic_score)
    end
  end
end
