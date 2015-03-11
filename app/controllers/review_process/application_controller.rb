module ReviewProcess
  class ApplicationController < ::ApplicationController
    layout 'review'
    load_and_authorize_resource :review
  end
end