require_relative '../setup.rb'

class UserApiV1 < Grape::API
  version 'v1', :using => :path
  format :json
  
    get '/records/first_name' do
      
    end

    get '/records/created_at' do
        
    end

    get '/records/last_name' do
 
    end
    
    post '/records' do
      
    end 
  

end