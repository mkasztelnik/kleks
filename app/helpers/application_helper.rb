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

  # Check if a particular controller is the current one
  #
  # args - One or more controller names to check
  #
  # Examples
  #
  #   # On TreeController
  #   current_controller?(:tree)           # => true
  #   current_controller?(:commits)        # => false
  #   current_controller?(:commits, :tree) # => true
  def current_controller?(*args)
    args.any? { |v| v.to_s.downcase == controller.controller_name }
  end

  # Check if a partcular action is the current one
  #
  # args - One or more action names to check
  #
  # Examples
  #
  #   # On Projects#new
  #   current_action?(:new)           # => true
  #   current_action?(:create)        # => false
  #   current_action?(:new, :create)  # => true
  def current_action?(*args)
    args.any? { |v| v.to_s.downcase == action_name }
  end

  # creates a comma-separated string for a collection
  def model_collection_to_s(model_collection)
    model_collection.collect { |model_obj| model_obj.to_s}.join(', ')
  end
end
