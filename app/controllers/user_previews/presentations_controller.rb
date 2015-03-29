module UserPreviews
  class PresentationsController < UserPreviews::ApplicationController
    def show
      @presentation = @user.presentation
    end
  end
end