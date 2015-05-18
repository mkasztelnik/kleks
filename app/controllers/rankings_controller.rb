class RankingsController < ApplicationController
  load_and_authorize_resource :review
  layout 'reviews'

  def show
    @applicants = User.ranking
  end
end
