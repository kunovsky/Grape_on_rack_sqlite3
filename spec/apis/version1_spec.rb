require 'spec_helper'

describe MyApi::UserApiV1, :type => :feature do
	include Rack::Test::Methods

	  def app
    MyApi::UserApiV1
  	end

	context "Helper methods" do

		context "format_post_info" do

			it 'should raise an error unless an entry for each attribute was provided' do
				attributes = "Tyson,Kunovsky,tyson@emaildotcom,1-906-235-0832"
				expect {FormatInfo.format_post_info(attributes)}.to raise_error
			end

			it 'should return an hash of correctly formatted data' do
				attributes = "Tyson,Kunovsky,tyson@emaildotcom,1-906-235-0832,2012-08-06T06:35:41-07:00"
				hash_form = {:first_name=>"Tyson", :last_name=>"Kunovsky", :email=>"tyson@emaildotcom", :phone=>"1-906-235-0832", :created_at=>"2012-08-06T06:35:41-07:00"}
				FormatInfo.format_post_info(attributes).should  == hash_form
			end

			context "Constant used by this method" do
				it 'should remain the same and never change' do
					FORMATTING_INFO.should == [:first_name, :last_name, :email, :phone, :created_at]
				end
			end
		end
	end

	context "routes" do

		context "/first_name" do

			it "should return a list of all users in Json form" do
				get '/v1/records/first_name'
				last_response.status.should == 200
				visit '/v1/records/first_name'
				
			end

		end
	end
end
