class EducationsController < AjaxController
  load_and_authorize_resource
  before_action :set_item, except: [:index]

  def index
    @educations = @educations.order(:start_date, :end_date)
  end

  private

  def set_item
    @item = @education
  end

  def education_params
    params.require(:education).
      permit(:program_name, :university_name,
             :education_type, :start_date, :end_date, :country)
  end

  alias_method :item_params, :education_params

  def count_id
    'education-count'
  end

  def count
    @count ||= current_user.educations.count
  end

  def count_class
    'badge-success' if count > 0
  end

  def application_state
    if current_user.application_ready?
      'application_ready'
    else
      'application_not_ready'
    end
  end
end
