require 'rails_helper'

RSpec.describe User do
  it 'creates new user while logging using omniauth' do
      expect { User.from_omniauth(auth) }.to change { User.count }.by(1)
    end

  it 'sets user details while logging using omniauth' do
    user = User.from_omniauth(auth)

    expect(user.name).to eq 'John Doe'
    expect(user.email).to eq 'a@b.c'
    expect(user.provider).to eq 'fb'
    expect(user.uid).to eq '123'
  end

  it 'reuse user account even if provider is different' do
    create(:user, email: 'a@b.c')

    expect { User.from_omniauth(auth) }.to change { User.count }.by(0)
  end

  def auth
    double 'auth',
            provider: 'fb',
            uid: '123',
            info: double(email: 'a@b.c',
                         first_name: 'John',
                         last_name: 'Doe',
                         gender: 'male',
                         image: 'img')
  end
end