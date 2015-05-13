require 'spec_helper'

RSpec.describe HomePageController, :type => :controller do
	describe "GET 'home_page'" do
		it "should be successful" do
			get 'home_page'
			response.should be_success
		end
	end
end
