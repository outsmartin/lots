set :application, "lots"
set :repository,  "git@github.com:outsmartin/lots.git"

set :scm, :git
server "lots.outsmartin.de", :app, :web, :db, :primary => true

set :deploy_to, "/var/www/apps/lots"
set :user ,"root"
set :use_sudo, false
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
namespace :thin do
  desc "Start the Thin processes"
  task :start do
    run  <<-CMD
      cd #{current_path}; bundle exec thin start -C config/thin.yml
    CMD
  end

  desc "Stop the Thin processes"
  task :stop do
    run <<-CMD
      cd #{current_path}; bundle exec thin stop -C config/thin.yml
    CMD
  end

  desc "Restart the Thin processes"
  task :restart do
    run <<-CMD
      cd #{current_path}; bundle exec thin restart -C config/thin.yml
    CMD
  end

end
after 'deploy', "thin:restart"
