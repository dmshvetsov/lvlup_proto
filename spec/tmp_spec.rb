require 'rails_helper'

RSpec.describe 'PG @@ search test' do
  describe '@@ with english chars' do
    it 'find russian words case insensitive' do
      skills_attr = [
        { title: 'soft milk' }, 
        { title: 'Soft milk' },
        { title: 'Soft Milk' },
        { title: 'SOFT MILK' },
        { title: 'soFt mILK' }
      ]

      Skill.create skills_attr
      expect(Skill.count).to eq skills_attr.size

      search_result = Skill.where("title @@ :q", q: 'soft milk')
      expect(search_result).to be_a ActiveRecord::Relation
      expect(search_result.count).to eq skills_attr.size
      expect(search_result).to match_array Skill.all
    end
  end

  describe '@@ with russian chars' do
    it 'find russian words case insensitive' do
      skills_attr = [
        { title: 'сухое молоко' }, 
        { title: 'Сухое молоко' },
        { title: 'Сухое Молоко' },
        { title: 'сухое МОЛОКО' },
        { title: 'сухое моЛОКо' }
      ]

      Skill.create skills_attr
      expect(Skill.count).to eq skills_attr.size

      search_result = Skill.where("title @@ :q", q: 'сухое молоко')
      expect(search_result).to be_a ActiveRecord::Relation
      expect(search_result.count).to eq skills_attr.size
      expect(search_result).to match_array Skill.all
    end
  end

  describe '@@ fancy test' do
    it 'search by uniq russian chars' do
      skills_attr = [
        { title: 'юбгяц' }, 
        { title: 'Юбгяц' },
        { title: 'ЮБГЯЦ' },
        { title: 'юбгяЦ' }
      ]

      Skill.create skills_attr

      search_result = Skill.where("title @@ :q", q: 'юбгяц')
      expect(search_result).to match_array Skill.all
    end
  end

end


RSpec.describe 'PG ILIKE search test' do
  describe 'ILIKE with english chars' do
    it 'find russian words case insensitive' do
      skills_attr = [
        { title: 'soft milk' }, 
        { title: 'Soft milk' },
        { title: 'Soft Milk' },
        { title: 'SOFT MILK' },
        { title: 'soft mILk' }
      ]

      Skill.create skills_attr
      expect(Skill.count).to eq skills_attr.size

      search_result = Skill.where("title ILIKE :q", q: '%soft milk%')
      expect(search_result).to be_a ActiveRecord::Relation
      expect(search_result.count).to eq skills_attr.size
      expect(search_result).to match_array Skill.all
    end
  end

  describe 'ILIKE with russian chars' do
    it 'find russian words case insensitive' do
      skills_attr = [
        { title: 'сухое молоко' }, 
        { title: 'Сухое молоко' },
        { title: 'Сухое Молоко' },
        { title: 'сухое МОЛОКО' },
        { title: 'сухое моЛОКо' }
      ]

      Skill.create skills_attr

      search_result = Skill.where("title ILIKE :q", q: '%сухое молоко%')
      expect(search_result).to be_a ActiveRecord::Relation
      expect(search_result.count).to eq skills_attr.size
      expect(search_result).to match_array Skill.all
    end
  end

end
