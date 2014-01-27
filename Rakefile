require 'rspec/core/rake_task'

require_relative 'config/application.rb'

namespace :db do

	desc "Creates the database"
	task :create do
		puts "Creating database..."
		UserDB.setup($db)
	end

	desc "Seeds the DB with the data from the csv file"
	task :seed  do
		puts "Seeding database..."
		UserDB.seed(Parser.parser('db/people.csv', User),$db)
	end

	desc "Drop the databases"
	task :drop do
		puts "Deleting databases..."
		rm_f 'user.db'
	end
end

desc 'Prepare testing database'
	task :testprep do
		puts "Deleting old test db... if it exits"
		rm_f 'user_testing.db'
		puts "Creating test db... "
		UserDB.setup(SQLite3::Database.new('user_testing.db'))
		puts "Seeding database..."
		UserDB.seed(Parser.parser('db/people.csv', User),SQLite3::Database.new('user_testing.db'))
		puts "Done"
	end


desc 'Start IRB with application environment loaded'
task :console do
	exec "irb -r./config/application"
end

desc "Run the specs"
task :spec do
	RSpec::Core::RakeTask.new(:spec)
end

