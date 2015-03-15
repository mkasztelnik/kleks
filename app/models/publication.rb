class Publication < ActiveRecord::Base
  validates :publication_title,
            presence: true

  validates :authors,
            presence: true

  validates :year,
            presence: true,
            numericality: { only_integer: true }

  validates :user,
            presence: true

  belongs_to :user

  def title
    "#{authors} (#{year}), #{publication_title}"
  end

  def subtitle
    editors_txt = editors.blank? ? "" : "#{editors},"
    "in  #{editors_txt} #{publisher} (#{language})"
  end
end
