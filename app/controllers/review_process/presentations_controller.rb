module ReviewProcess
  class PresentationsController < ReviewProcess::ApplicationController
    def show
      @presentation = @review.presentation
    end
  end
end
