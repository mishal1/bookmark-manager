require 'data_mapper'

require './lib/user'
require './lib/link'
require './lib/tag'

require_relative 'data_mapper_setup.rb'

task :auto_upgrade do
	DataMapper.auto_upgrade!
	puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do
	DataMapper.auto_migrate!
	puts "Auto-migrate complete (data could have been lost)"
end

#Rakefile only checks development as it was set up in data_mapper_setup
#To update/mirgrate other env => rake auto_upgrade RACK_ENV=test