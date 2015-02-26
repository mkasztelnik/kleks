class OthersController < AjaxController
  load_and_authorize_resource
  before_action :set_item

  private

  def set_item
    @item = @other
  end

  def other_params
    params.require(:other).permit(:title)
  end

  alias_method :item_params, :other_params

  def count_id
    'academic-count'
  end

  def count
    @count ||= current_user.academic_count
  end
end