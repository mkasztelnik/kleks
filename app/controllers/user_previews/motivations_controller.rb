module UserPreviews
  class MotivationsController < UserPreviews::ApplicationController
    def show
      @motivation = @user.motivation
    end
  end
end