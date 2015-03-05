class General < ActiveRecord::Base
  validates :accept,
            acceptance: { accept: true}

  belongs_to :user,
             required: true
end
