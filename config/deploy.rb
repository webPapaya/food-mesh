require "bundler/capistrano"
require "rvm/capistrano"
#
set :rvm_ruby_string, "ruby-2.0.0-p247"
set :rvm_type, :system
set :application, "Food Mesh"
set :repository,  "git@git.mediacube.at:fhs34784/food-mesh.git"
set :scm, :git
set :user, "deploy_eight"
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
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end