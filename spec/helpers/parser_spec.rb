require 'spec_helper'
require 'date'

describe Parser do

	context 'Parser is properly parsing a file' do

		it 'should return an array of 200 user objects from the 200 line people.csv file' do
			Parser.parser('db/people.csv', User).length.should eq(200)
		end
	end

	context 'User objects returned by the parser' do

		it 'should return an array, each item of which is an istance of the User class' do
			Parser.parser('db/people.csv', User).each do |user_object|
				user_object.should be_an_instance_of(User)
			end
		end

		context "Returned object first_name" do

			it 'should have an readable first_name attribute which is a string' do
				random_user_object = Parser.parser('db/people.csv', User)[rand(0..199)]
				random_user_object.first_name.should be_an_instance_of(String)
			end
		end

		context "Returned object last_name" do

			it 'should have an readable last_name attribute which is a string' do
				random_user_object = Parser.parser('db/people.csv', User)[rand(0..199)]
				random_user_object.last_name.should be_an_instance_of(String)
			end
		end

		context "Returned object email" do

			it 'should have an readable email attribute which is a string' do
				random_user_object = Parser.parser('db/people.csv', User)[rand(0..199)]
				random_user_object.email.should be_an_instance_of(String)
			end
		end

		context "Returned object phone" do

			it 'should have an readable phone attribute which is a string' do
				random_user_object = Parser.parser('db/people.csv', User)[rand(0..199)]
				random_user_object.phone.should be_an_instance_of(String)
			end
		end

		context "Returned object created_at" do

			it 'should have an readable created_at attribute which is a string' do
				random_user_object = Parser.parser('db/people.csv', User)[rand(0..199)]
				random_user_object.created_at.should be_an_instance_of(String)
			end

			it 'should return a valid datetime string which can be converted into a datetime object' do
				random_user_object = Parser.parser('db/people.csv', User)[rand(0..199)]
				DateTime.parse(random_user_object.created_at).should be_an_instance_of(DateTime)
			end
		end

	end
end