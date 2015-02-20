require 'rails_helper'

RSpec.describe Profile, :type => :model do
  it { should respond_to :uid, :nickname, :image, :url, :oauth_token, :oauth_expires_at }

  describe '.find_or_create_from_auth_hash' do
    subject(:method) { Profile.find_or_create_from_auth_hash }
    context 'when no user with given uid in hash' do
      it 'create new profile record' do
        pending 'need a auth_hash'
        expect{method}.to change(Profile, :count).by 1
      end
    end
  end
end
