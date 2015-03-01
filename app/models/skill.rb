class Skill < ActiveRecord::Base
  has_many :characteristics
  has_many :profiles, through: :characteristics
  validates :title, presence: true, uniqueness: true
end
