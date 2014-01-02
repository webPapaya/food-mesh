require "bundler/capistrano"
require "rvm/capistrano"
#
set :rvm_ruby_string, "ruby-2.0.0-p247"
set :rvm_type, :system
set :application, "Food Mesh"
set :repository,  "git@git.mediacube.at:fhs34784/food-mesh.git"
set :scm, :git
set :user, "deploy_foodmesh"
set :branch, "master"
#
set :use_sudo, false
#
set :deploy_to, "/var/www/virthosts/eight"
#
role :web, "rails.multimediatechnology.at:5412"                          # Your HTTP server, Apache/etc
role :app, "rails.multimediatechnology.at:5412"                          # This may be the same as your `Web` server
role :db,  "rails.multimediatechnology.at:5412", :primary => true # This is where Rails migrations will run
#
# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  namespace :assets do
    task :precompile, :roles => assets_role, :except => { :no_release => true } do
      run <<-CMD.compact
        cd -- #{latest_release.shellescape} &&
        #{rake} RAILS_ENV=#{rails_env.to_s.shellescape} #{asset_env} assets:precompile
      CMD
    end
  end
end


set :application, "set your application name here"
set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "rails.mediacube.at"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

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