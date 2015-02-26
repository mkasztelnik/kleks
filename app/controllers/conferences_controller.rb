class ConferencesController < AjaxController
  load_and_authorize_resource
  before_action :set_item

  private

  def set_item
    @item = @conference
  end

  def conference_params
    params.require(:conference).
      permit(:title, :address, :conference_name,
             :presentation_type, :start_date, :end_date)
  end

  alias_method :item_params, :conference_params

  def count_id
    'academic-count'
  end

  def count
    @count ||= current_user.academic_count
  end
end