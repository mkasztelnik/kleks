module UserPreviews
  class OverviewsController < UserPreviews::ApplicationController
    def show
      elements = [
        :general, :profile, :motivation, :presentation,
        :educations, :publications, :conferences, :trainings, :others,
        :language
      ]
      @user = User.includes(elements).
              references(elements).where(id: params[:user_id]).first
    end
  end
end
