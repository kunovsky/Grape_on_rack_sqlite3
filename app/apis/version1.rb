require_relative '../../config/application.rb'

FORMATTING_INFO = [:first_name, :last_name, :email, :phone, :created_at]

module FormatInfo
	def self.format_post_info(info)
		formatted_hash = Hash.new
		user_info = info.split(",")
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

module MyApi
	class UserApiV1 < Grape::API
		version 'v1', :using => :path
		format :json
		helpers FormatInfo
		
		resource :records do

			desc "Returns all users in the db sorted by first name alphabetically as a json object"
			get '/first_name' do
				User.sorted_by_first_name.to_json
			end

			desc "Returns all users in the db sorted by created date as a json object"
			get '/created_at' do
				User.sorted_by_created_at.to_json
			end

			desc "Returns all users in the db sorted by last name alphabetically as a json object"
			get '/last_name' do
				User.sorted_by_last_name.to_json
			end

			desc "Lets you make a post request to the db using correctly formatted information"
			post '/:info' do
				user = User.new(FormatInfo.format_post_info(params[:info]))
				user.save
			end 

		end
	end
end