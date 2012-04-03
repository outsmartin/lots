set :application, "lots"
set :repository,  "git@github.com:outsmartin/lots.git"

set :scm, :git
server "lots.outsmartin.de", :app, :web, :db, :primary => true

set :deploy_to, "/var/www/apps/lots"
set :user ,"root"
set :use_sudo, false
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
