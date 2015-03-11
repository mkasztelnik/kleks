module ReviewProcess
  class WorksController < ReviewProcess::ApplicationController
    def index
      @works = @review.works
    end
  end
end
