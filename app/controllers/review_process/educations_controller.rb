module ReviewProcess
  class EducationsController < ReviewProcess::ApplicationController
    def index
      @educations = @review.educations
    end
  end
end
