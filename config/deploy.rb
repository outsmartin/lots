set :application, "lots"
set :repository,  "git@github.com:outsmartin/lots.git"

set :scm, :git
server "lots.outsmartin.de", :app, :web, :db, :primary => true

set :deploy_to, "/var/www/apps/lots"
set :user ,"root"
set :use_sudo, false
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ config/application.rb | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end
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
