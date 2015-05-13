require 'spec_helper'
=begin
RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
=end
#
describe User do
	before :each do
		@user = User.new "Some Name", :provider #create an object before each test
	end
end