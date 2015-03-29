module UserPreviews
  class EducationsController < UserPreviews::ApplicationController
    def show
      @educations = @user.educations
    end
  end
end