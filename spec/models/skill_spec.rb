require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe '.search' do
    it 'seart by title case insensitive' do
      skills_attr = [
        { title: 'стопудовая гиря' },
        { title: 'Стопудовая гиря' },
        { title: 'Стопудовая Гиря' },
        { title: 'СТОПУДОВАЯ гиря' }
      ]

      Skill.create skills_attr

      expect(Skill.search('стопудовая гиря').size).to eq 4
    end
  end
end
