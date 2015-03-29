module UserPreviews
  class LanguagesController < UserPreviews::ApplicationController
    def show
      @language = @user.language
    end
  end
end