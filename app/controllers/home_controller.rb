class HomeController < ApplicationController
  def show
    if current_user.reviewer
      redirect_to reviews_path
    else
      redirect_to general_path
    end
  end
end
