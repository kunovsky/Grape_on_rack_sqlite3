require_relative '../../config/application.rb'

FORMATTING_INFO = [:first_name, :last_name, :email, :phone, :created_at]

module MyApi
	
	class UserApiV1 < Grape::API
		version 'v1', :using => :path
		format :json

		helpers do
			def format_post_info(info)
				formatted_hash = Hash.new
				user_info = info.split("|")
				formatting_info = FORMATTING_INFO.dup
				if user_info.length != formatting_info.length
					raise ArgumentError.new('Attribute names can\'t be blank')
				else
					until formatting_info.empty?
						formatted_hash[formatting_info.shift] = user_info.shift
					end
				end
				formatted_hash
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
				user = User.new(format_post_info(params[:info]))
				user.save
			end 
		end
	end
end