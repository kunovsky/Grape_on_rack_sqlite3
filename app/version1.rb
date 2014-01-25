require_relative '../setup.rb'

class UserApiV1 < Grape::API
	version 'v1', :using => :path
	format :json

	helpers do
		def format_post_info(info)
			info.split(",")
		end
	end

	resource :records do
		get '/first_name' do
			User.sorted_by_first_name.to_json
		end

		get '/created_at' do
			User.sorted_by_created_at.to_json
		end

		get '/last_name' do
			User.sorted_by_last_name.to_json
		end

		post '/:info' do
			p format_post_info(params[:info])
			# user = User.new(format_post_info(params[:info]))
			# user.save
		end 
	end
end