class Characteristic < ActiveRecord::Base
  belongs_to :skill
  belongs_to :profile
  has_many :lvlups
  validates :skill_id, :profile_id, presence: true
  delegate :title, to: :skill
end
