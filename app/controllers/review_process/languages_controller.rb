module ReviewProcess
  class LanguagesController < ReviewProcess::ApplicationController
    def show
      @language = @review.language
    end
  end
end
