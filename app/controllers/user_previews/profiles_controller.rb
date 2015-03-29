module UserPreviews
  class ProfilesController < UserPreviews::ApplicationController
    def show
      @profile = @user.profile
    end
  end
end