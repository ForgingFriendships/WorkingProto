class User < ActiveRecord::Base
  # Almudena says attr_accessible should be OK here she thinks
  attr_accessible :name, :provider, :uid, :email
  attr_protected :admin
  def self.create_with_omniauth(auth)
    User.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"],
      )
  end
end
