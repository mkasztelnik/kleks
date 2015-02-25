class WorksController < AjaxController
  load_and_authorize_resource
  before_action :set_item, except: [:index]

  def index
  end

  def set_item
    @item = @work
  end

  def work_params
    params.require(:work).
      permit(:institution, :responsibility,
             :country, :start_date, :end_date)
  end

  alias_method :item_params, :work_params

  private

  def count_id
    'work-count'
  end

  def count
    current_user.works.count
  end
end
