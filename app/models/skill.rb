class Skill < ActiveRecord::Base
  include PgSearch

  has_many :characteristics
  has_many :profiles, through: :characteristics
  has_many :lvlups, through: :characteristics
  validates :title, presence: true, uniqueness: true

  pg_search_scope :search, against: :title
end
