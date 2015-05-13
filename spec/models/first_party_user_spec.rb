require 'spec_helper'

describe FirstPartyUser do
  before(:each) do
  	@attr = {
  		:name => "Name Lastname",
  		:email => "email@email.com",
  		:password => "password",
  		:password_confirmation => "password"
  	}
  end

  it "should create a new instance given valid attributes" do
  	FirstPartyUser.create!(@attr)
  end

  it "should require a name" do
  	no_name_FirstPartyUser = FirstPartyUser.new(@attr.merge(:name => ""))
  	no_name_FirstPartyUser.should_not be_valid
  end

  it "should require an email address" do
  	no_email_FirstPartyUser = FirstPartyUser.new(@attr.merge(:email => ""))
  	no_email_FirstPartyUser.should_not be_valid
  end

  it "should reject names that are too long" do
  	long_name = "a" * 51
  	long_name_FirstPartyUser = FirstPartyUser.new(@attr.merge(:name => long_name))
  	long_name_FirstPartyUser.should_not be_valid
  end

  it "should reject invalid email addresses" do
  	invalid_emails = %w[email@email,com email_at_email.com email.com@email.]
  	invalid_emails.each do |email|
  		invalid_email_FirstPartyUser = FirstPartyUser.new(@attr.merge(:email => email))
  		invalid_email_FirstPartyUser.should_not be_valid
  	end
  end

  it "should reject duplicate email addresses" do
  	FirstPartyUser.create!(@attr)
  	FirstPartyUser_with_dupe_email = FirstPartyUser.new(@attr)
  	FirstPartyUser_with_dupe_email.should_not be_valid
  end

  describe "password validations" do
=begin
  	it "should require a password" do
  		FirstPartyUser.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
  	end

  	it "should require a matching password_confirmation" do
  		FirstPartyUser.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
  	end

  	it "should reject short passwords" do
  		short = "a"
  		FirstPartyUser.new(@attr.merge(:password => short, :password_confirmation => short)).should_not be_valid
  	end

  	it "should reject long passwords" do
  		long = "a" * 100
  		FirstPartyUser.new(@attr.merge(:password => long, :password_confirmation => long)).should_not be_valid
  	end
=end
	describe "password encryption" do
		before(:each) do 
			@FirstPartyUser = FirstPartyUser.create!(@attr)
		end
		it "should set the encrypted password" do
			@FirstPartyUser.password_digest.should_not be_blank
		end

		#additional password tests go here etc
	end
  end


end