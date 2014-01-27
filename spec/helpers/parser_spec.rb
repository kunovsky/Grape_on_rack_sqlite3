require 'spec_helper'

describe Parser do
	it 'should return an array of 200 user objects from the people.csv file' do
		Parser.parser('db/people.csv', User).length.should eq(200)
	end

	it 'should return an array that consists of all user objects' do
		
	end

	context 'Returned User object array' do
		it 'should have fully created User objects with all the required attributes' do

		end
	end

end