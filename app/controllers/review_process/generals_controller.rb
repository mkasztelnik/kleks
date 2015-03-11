module ReviewProcess
  class GeneralsController < ReviewProcess::ApplicationController
    def show
      @general = @review.general
    end
  end
end
