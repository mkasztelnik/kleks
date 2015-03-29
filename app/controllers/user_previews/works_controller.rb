module UserPreviews
  class WorksController < UserPreviews::ApplicationController
    def show
      @works = @user.works
    end
  end
end