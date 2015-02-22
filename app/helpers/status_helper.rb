module StatusHelper
  def ready?(field)
    field && !field.new_record?
  end

  def check_if_ready(field)
    if ready?(field)
      content_tag(:div, class: 'pull-right') do
        content_tag(:i, '', class: 'fa fa-check success')
      end
    end
  end
end