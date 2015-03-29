class UsersController < ApplicationController
  def index
    redirect_to user_general_path(User.applicants.first)
  end

  def show
    redirect_to user_general_path(user_id: params[:id])
  end
end
