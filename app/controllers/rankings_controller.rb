class RankingsController < ApplicationController
  load_and_authorize_resource :review
  layout 'reviews'

  def show
    @applicants = User.submitted.
                  includes(:reviews, :educations).
                  references(:reviews, :educations).
                  order(:last_name, :first_name)

    @applicants = @applicants.
                  sort { |a, b| (b.score || -1) <=> (a.score || -1) }
  end
end
