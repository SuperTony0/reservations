class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid

  def self.find_for_oauth(auth)
    identity = find_by(uid: auth.uid)
    identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
    identity.name = auth.info.name
    identity.email = auth.info.email
    identity.image = auth.info.image
    identity.save
    identity
  end
end
