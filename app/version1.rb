require_relative '../setup.rb'

class UserApiV1 < Grape::API
  version 'v1', :using => :path
  format :json
  
    get '/' do
        User.where("first_name = ?", "Amber")
    end
    
    post '/' do
      {:word => params[:word], :result => "thinking"}.to_json
    end 
  
  resource :sentences do
    get ':sentence' do
      {:sentence => params[:sentence], :result => "unkown"}.to_json
    end
  end

end