class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :email, :password, :password_confirmation
  attr_protected :admin

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,      :presence     => true, 
                        :length       => {  :maximum  => 50 }
  validates :email,     :presence     => true,
                        :format       => {  :with     => email_regex }, :unless => :has_provider?,
                        :uniqueness   => {  :case_sensitive => false }

  def has_provider?
    provider && provider
  end

  has_and_belongs_to_many :events

  def self.create_with_omniauth(auth)
    User.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"],
      )
  end
end
