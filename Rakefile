require 'rspec/core/rake_task'

require_relative 'config/application.rb'

$db = SQLite3::Database.new 'user.db'

namespace :db do

	desc "Creates the database"
	task :create do
		puts "Creating database..."
		UserDB.setup($db)
	end

	desc "Seeds the DB with the data from the csv file"
	task :seed  do
		puts "Seeding database..."
		UserDB.seed(Parser.parser('db/people.csv'),$db)
	end

	desc "Drop the database"
	task :drop do
		puts "Deleting database..."
		rm_f 'user.db'
	end
end


desc 'Start IRB with application environment loaded'
task :console do
	exec "irb -r./config/application"
end

desc "Run the specs"
task :spec do
	RSpec::Core::RakeTask.new(:spec)
end

