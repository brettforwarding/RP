class User < ActiveRecord::Base
  #attr_accessible :email, :name, :oauth_token, :oauth_expires_at, :provider, :uid
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.email = auth.info.email
      user.save!
    end
  end
end
# == Schema Information
#
# Table name: users
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  email            :string(255)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  provider         :string(255)
#  uid              :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#

