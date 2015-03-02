class DateIntervalInput < SimpleForm::Inputs::TextInput
  def input(wrapper_options)
    input_html_options[:class] = 'form-control'
    input_html_options['data-provide'] = 'datepicker'
    input_html_options['data-date-format'] = 'yyyy-mm-dd'

    template.content_tag(:div, class: 'input-daterange input-group') do
      @builder.text_field("start_#{attribute_name}", input_html_options) +
      template.content_tag(:span, '-', class: 'input-group-addon') +
      @builder.text_field("end_#{attribute_name}", input_html_options)
    end
  end

  def errors_on_attribute
    object.errors["start_#{attribute_name}"] +
      object.errors["end_#{attribute_name}"]
  end
end
