require 'spec_helper'

describe MyApi::UserApiV1, :type => :feature do
	include Rack::Test::Methods

	def app
		MyApi::UserApiV1
	end

	context "API endpoints" do

		context "Non existant endpoint" do

			it "should not load pages that do not exist" do
				visit '/v1/records/invalid/test'
				expect(page).to have_content "Not Found"
				get '/v1/records/invalid/test'
				last_response.status.should == 404
			end
		end

		context "/first_name" do

			it "should sucessfully load the page" do
				all_users = User.sorted_by_created_at
				get '/v1/records/first_name'
				last_response.status.should == 200
				visit '/v1/records/first_name'
				expect(page).to have_content all_users[rand(0..199)][3]
			end
		end

		context "/last_name" do

			it "should sucessfully load the page" do
				all_users = User.sorted_by_created_at
				get '/v1/records/last_name'
				last_response.status.should == 200
				visit '/v1/records/last_name'
				expect(page).to have_content all_users[rand(0..199)][4]
			end
		end

		context "/created_at" do

			it "should sucessfully load the page" do
				all_users = User.sorted_by_created_at
				get '/v1/records/created_at'
				last_response.status.should == 200
				visit '/v1/records/created_at'
				expect(page).to have_content all_users[rand(0..199)][2]
			end
		end

	end
end
