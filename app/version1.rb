require_relative '../setup.rb'

class UserApiV1 < Grape::API
	version 'v1', :using => :path
	format :json

	get '/records/first_name' do
		User.sorted_by_first_name.to_json
	end

	get '/records/created_at' do
		User.sorted_by_created_at.to_json
	end

	get '/records/last_name' do
		User.sorted_by_last_name.to_json
	end

	post '/records' do

	end 


end