class PublicationsController < AjaxController
  load_and_authorize_resource
  before_action :set_item

  private

  def set_item
    @item = @publication
  end

  def publication_params
    params.require(:publication).
      permit(:title, :publication_title, :authors,
             :year, :language, :publisher)
  end

  alias_method :item_params, :publication_params

  def count_id
    'academic-count'
  end

  def count
    @count ||= current_user.academic_count
  end
end
