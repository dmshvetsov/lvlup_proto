class Lvlup < ActiveRecord::Base
  belongs_to :characteristic
  validates :description, :characteristic_id, presence: true
end
