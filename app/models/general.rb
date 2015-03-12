class General < ActiveRecord::Base
  belongs_to :user,
             required: true

  validates :accept,
            acceptance: { accept: true}

  validates :accept_travel,
            acceptance: { accept: true}

  validates :accept_insurance,
            acceptance: { accept: true}
end
