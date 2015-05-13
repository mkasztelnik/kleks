module UserHelper
  def name_with_gender(user)
    color = { 'Male' => 'icon-mars', 'Female' => 'icon-venus' }[user.gender]
    icon_name = { 'Male' => 'mars', 'Female' => 'venus' }[user.gender]

    icon(icon_name, user.name,
         class: color, title: user.gender, data: { placement: 'bottom' })
  end
end
