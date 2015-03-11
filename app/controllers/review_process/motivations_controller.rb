module ReviewProcess
  class MotivationsController < ReviewProcess::ApplicationController
    def show
      @motivation = @review.motivation
    end
  end
end
