require 'rails_helper'

RSpec.describe Review do
  it 'calculate score when all review elements are ready' do
    review = build(:review,
                   motivation_score: 1,
                   presentation_score: 2,
                   education_score: 3,
                   academic_score: 4,
                   work_score: 5,
                   language_score: 6)

    expect(review.score).to eq 21
  end

  it 'returns null when at least one review element is empty' do
    review = build(:review,
                   motivation_score: nil,
                   presentation_score: 2,
                   education_score: 3,
                   academic_score: 4,
                   work_score: 5,
                   language_score: 6)

    expect(review.score).to be_nil
  end
end
