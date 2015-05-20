class ReportsController < ApplicationController
  layout 'reviews'

  def show
    authorize! :read, Review

    elements = [
      :general, :profile, :motivation, :presentation,
      :educations, :publications, :conferences, :trainings, :others,
      :language
    ]
    @users = User.submitted.
             includes(elements).references(elements).
             order(:last_name, :first_name)
  end
end
