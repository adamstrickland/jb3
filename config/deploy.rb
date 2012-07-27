require 'bundler/capistrano'

set :application, "jb3"
set :scm, :git
set :repository,  "git://github.com/adamstrickland/jb3.git"

server "jobs.levoleague.com", :web, :app, :db, :primary => true

ssh_options[:port] = 33
ssh_options[:keys] = "~/.ssh/id_rsa"

set :user, "adamstrickland"  # use "lladmin" (need to set up )
set :group, "rails"
set :deploy_to, "/data/deploy/jb3"
set :use_sudo, true
set :deploy_via, :copy
set :copy_strategy, :export

namespace :deploy do
	task :start do
	end

	task :stop do
	end

	desc "Restart the application"
	task :restart, :roles => :app, :except => { :no_release => true } do
		run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
	end

	desc "Copy the database.yml file into the latest release"
	task :copy_in_database_yml do
		run "cp #{shared_path}/config/database.yml #{latest_release}/config/"
	end
end
before "deploy:assets:precompile", "deploy:copy_in_database_yml"

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# # if you want to clean up old releases on each deploy uncomment this:
# # after "deploy:restart", "deploy:cleanup"

# # if you're still using the script/reaper helper you will need
# # these http://github.com/rails/irs_process_scripts

# # If you are using Passenger mod_rails uncomment this:
# # namespace :deploy do
# #   task :start do ; end
# #   task :stop do ; end
# #   task :restart, :roles => :app, :except => { :no_release => true } do
# #     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
# #   end
# # end