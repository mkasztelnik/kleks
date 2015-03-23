require 'rails_helper'

RSpec.describe SubmitController do
  let(:user) { create(:user).tap { |u| u.confirm! } }
  before { sign_in(user) }

  it 'submit form when application is ready' do
    create(:general, user: user)
    create(:profile, user: user)
    create(:motivation, user: user)
    create(:presentation, user: user)
    create(:education, user: user)
    create(:language, user: user)

    post :submit
    user.reload

    expect(user.submitted).to be_truthy
    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to root_path
    expect(flash[:notice]).to match(/submitted successfully/)
  end

  it 'rejest to submit not ready application' do
    post :submit
    user.reload

    expect(user.submitted).to be_falsy
    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to root_path
    expect(flash[:alert]).to match(/not ready/)
  end
end
