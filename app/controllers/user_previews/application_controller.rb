module UserPreviews
  class ApplicationController < ::ApplicationController
    layout 'user'
    load_and_authorize_resource :user
  end
end