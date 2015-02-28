class TrainingsController < AjaxController
  load_and_authorize_resource
  before_action :set_item

  private

  def set_item
    @item = @training
  end

  def training_params
    params.require(:training).
      permit(:institution, :gained_experience,
             :country, :start_date, :end_date)
  end

  alias_method :item_params, :training_params

  def count_id
    'academic-count'
  end

  def count
    @count ||= current_user.academic_count
  end
end
