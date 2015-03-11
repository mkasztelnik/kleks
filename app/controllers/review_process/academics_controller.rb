module ReviewProcess
  class AcademicsController < ReviewProcess::ApplicationController
    def index
      @educations = @review.educations
    end
  end
end
