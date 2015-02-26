class AcademicsController < ApplicationController
  def index
    @conferences = Conference.accessible_by(current_ability)
  end
end
