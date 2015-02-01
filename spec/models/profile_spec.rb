require 'rails_helper'

RSpec.describe Profile, :type => :model do
  it { should respond_to :uid, :nickname, :image, :url, :oauth_token, :oauth_expires_at }
end
