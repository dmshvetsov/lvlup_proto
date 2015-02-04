class Profile < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_initialize_by(uid: auth_hash.uid).tap do |user|
      user.uid = auth_hash.uid
      user.nickname = auth_hash.info.name
      user.image = auth_hash.info.image
      user.url = auth_hash.info.urls.Facebook
      user.oauth_token = auth_hash.credentials.token
      user.oauth_expires_at = Time.at(auth_hash.credentials.expires_at)
      user.save!
    end
  end
end
