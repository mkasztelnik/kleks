module UserPreviews
  class GeneralsController < UserPreviews::ApplicationController
    def show
      @general = @user.general
    end
  end
end