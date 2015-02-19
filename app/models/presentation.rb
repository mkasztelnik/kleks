class Presentation < ActiveRecord::Base
  validates :abstract, presence: true

  belongs_to :user
end
