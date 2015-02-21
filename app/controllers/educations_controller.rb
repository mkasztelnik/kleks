class EducationsController < AjaxController
  load_and_authorize_resource
  before_action :set_item, except: [:index]

  def index
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
end
