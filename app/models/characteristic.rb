class Characteristic < ActiveRecord::Base
  belongs_to :skill
  belongs_to :profile
  validates :skill_id, :profile_id, presence: true
end
