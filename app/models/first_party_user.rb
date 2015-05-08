class FirstPartyUser < ActiveRecord::Base
  # Almudena says attr_accessible should be OK here she thinks
  attr_accessible :name, :provider, :uid, :email, :password, :password_confirmation
  attr_protected :admin
#=begin
  #Model validations
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,      :presence     => true, 
                        :length       => {  :maximum  => 50 }
  validates :email,     :presence     => true,
                        :format       => {  :with     => email_regex },
                        :uniqueness   => {  :case_sensitive => false }
  has_secure_password


  #:has_provider?#adds automatically: password presence, length, confirmation
  #validates :password_digest, :presence => true
   #                           :unless   => :has_provider?
#=end
=begin
  validates :password,  :presence     => true, # unless: -> { :from_omniauth? },
                        :confirmation => true,
                        #:length       => {  :within   => 6..40 },
                        :unless       => :has_provider?
=end

  #has_secure_password


  has_and_belongs_to_many :events
####DO WE EvEN NEED THIS
  def self.create_with_omniauth(auth)
    User.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"],
      )
  end
end
