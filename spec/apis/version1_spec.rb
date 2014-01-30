require 'spec_helper'

$db = SQLite3::Database.open 'user_testing.db'

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

		context "/:info" do

			it "should allow a post to the db with correct params and return a 201 created" do
				post "/v1/records/James,Mccarthy,#{rand(1..1000)}tkunovsky#{rand(1..1000)}@emaildotcom,2062401332,created_at"
				last_response.status.should == 201
			end
		end

	end
end
