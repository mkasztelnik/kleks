module ReviewProcess
  class ProfilesController < ReviewProcess::ApplicationController
    def show
      @profile = @review.profile
    end
  end
end
