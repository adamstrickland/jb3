require 'bundler/capistrano'

set :application, "jb3"
set :scm, :git
set :repository,  "git://github.com/adamstrickland/jb3.git"
set :user, "adamstrickland"  # use "lladmin" (need to set up )
set :group, "rails"
set :deploy_to, "/data/deploy/jb3"
set :use_sudo, true
set :deploy_via, :copy
set :copy_strategy, :export

server "jobs.levoleague.com", :web, :app, :db, :primary => true

ssh_options[:port] = 33
ssh_options[:keys] = "~/.ssh/id_rsa"

# Unicorn+Nginx
# after "deploy", "deploy:cleanup"
# namespace :deploy do
# 	%w[start stop restart].each do |command|
# 		desc "#{command} unicorn server"
# 		task command, :roles => :app, :except => { :no_release => true } do
# 			run "/etc/init.d/unicorn_#{application} #{command}"
# 		end
# 	end

# 	task :setup_config, :roles => :app do
# 		sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
# 		sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
# 		run "mkdir -p #{shared_path}/config"
# 		put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
# 		puts "Now edit the config files in #{shared_path}"
# 	end
# 	after "deploy:setup", "deploy:setup_config"

# 	task :symlink_config, :roles => :app do
# 		run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
# 	end
# 	after "deploy:finalize_update", "deploy:symlink_config"

# 	desc "make sure local git is in syn with remote."
# 	task :check_revision, :roles => :web do
# 		unless `git rev-parse HEAD` == `git rev-parse origin/master`
# 			puts "WARNING: HEAD is not the same as origin/master"
# 			puts "Run `git push` to sync changes."
# 			exit
# 		end
# 	end
# 	before "deploy", "deploy:check_revision"
# end

# Passenger+Apache
namespace :deploy do
	task :start do
	end

	task :stop do
	end

	desc "Restart the application"
	task :restart, :roles => :app, :except => { :no_release => true } do
		run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
	end

# 	desc "Copy the database.yml file into the latest release"
# 	task :copy_in_database_yml do
# 		run "cp #{shared_path}/config/database.yml #{latest_release}/config/"
# 	end
end
# before "deploy:assets:precompile", "deploy:copy_in_database_yml"

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