require 'rails_helper'

RSpec.describe User do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it { should have_one(:general).dependent(:destroy) }
  it { should have_one(:profile).dependent(:destroy) }
  it { should have_one(:motivation).dependent(:destroy) }
  it { should have_one(:presentation).dependent(:destroy) }
  it { should have_one(:language).dependent(:destroy) }
  it { should have_many(:educations).dependent(:destroy) }
  it { should have_many(:conferences).dependent(:destroy) }
  it { should have_many(:others).dependent(:destroy) }
  it { should have_many(:works).dependent(:destroy) }
  it { should have_many(:publications).dependent(:destroy) }
  it { should have_many(:trainings).dependent(:destroy) }
  it { should have_many(:reviews).dependent(:destroy) }

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

  it 'calculate academic count' do
    user = create(:user)
    create(:conference, user: user)
    create(:other, user: user)
    create(:publication, user: user)
    create(:training, user: user)

    expect(user.academic_count).to eq 4
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

  context 'score' do
    it 'is calculated when all reviews are ready' do
      user = create(:user)
      review(user, 1)
      review(user, 2)

      expect(user.score).to eq 1.5
    end

    it 'is nil when at least one review is not ready' do
      user = create(:user)
      review(user, 1)
      review(user, nil)

      expect(user.score).to be_nil
    end

    def review(user, motivation_score)
      create(:review, user: user,
             motivation_score: motivation_score,
             presentation_score: 0,
             education_score: 0,
             academic_score: 0,
             work_score: 0,
             language_score: 0)
    end
  end

  context 'highest education' do
    it 'chooses highest degree' do
      user = build(:user,
                   educations: [
                     build(:education, education_type: :ma),
                     build(:education, education_type: :phd),
                     build(:education, education_type: :ba)
                   ])

      expect(user.highest_education.education_type).to eq 'phd'
    end

    it 'chooses latest end date when 2 degrees equals' do
      user = build(:user,
                   educations: [
                     build(:education,
                            education_type: :ma,
                            start_date: Date.new(2013, 1, 1),
                            end_date: Date.new(2014, 1, 1)),
                     build(:education,
                            education_type: :ma,
                            start_date: Date.new(2014, 1, 1),
                            end_date: Date.new(2015, 1, 1))
                   ])

      expect(user.highest_education.end_date).to eq Date.new(2015, 1, 1)
    end
  end
end
