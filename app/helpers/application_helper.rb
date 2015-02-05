module ApplicationHelper
  def authicon(provider)
    icon_name, class_name = case provider
                            when :facebook
                              ['facebook-square', 'oauth-facebook']
                            when :google_oauth2
                              ['google-plus-square', 'oauth-google']
                            else
                              ['sign-in', 'oauth-sign-in']
                            end
    icon(icon_name, '', class: class_name)
  end
end
