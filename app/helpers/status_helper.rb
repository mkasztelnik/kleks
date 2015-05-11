module StatusHelper
  def ready?(field)
    field && !field.new_record?
  end

  def check_if_ready(field)
    if ready?(field)
      content_tag(:div, class: 'pull-right') do
        content_tag(:i, '', class: 'fa fa-check success check-in-menu')
      end
    end
  end

  def education_count(user = current_user)
    count = user.educations.count
    success = count > 0 ? 'badge-success' : ''
    count_badge(count, id: 'education-count', class: success)
  end

  def count_badge(count, options = {})
    classes = "badge #{options.fetch(:class, '')}"

    content_tag(:div, class: 'pull-right') do
      content_tag(:span, count, id: options[:id], class: classes)
    end
  end

  def score_badge(score, tooltip_text = nil)
    options = { class: "badge #{score ? 'badge-success' : ''}" }
    if tooltip_text
      options[:data] = { placement: 'bottom' }
      options[:title] = tooltip_text
    end

    content_tag(:span, score || '?', options)
  end
end
