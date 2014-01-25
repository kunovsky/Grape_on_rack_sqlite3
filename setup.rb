require 'rubygems'
require 'csv'
require 'sqlite3'
require 'grape'
require 'json'

require_relative 'users.rb'
require_relative 'parser.rb'
require_relative 'db_setup.rb'

#UserDB.setup
#UserDB.seed(Parser.parser('db/people.csv'))
