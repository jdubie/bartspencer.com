set :application, "bartspencer.com"
set :repository,  "https://github.com/jdubie/bart"



##################################
# Edit these
set :application, "bart"
set :node_file, "app.js"
set :host, "bartspencer.com"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]
set :repository,  "git://github.com/jdubie/bart.git"
set :branch, "master"
set :deploy_to, "/home/deploy/#{application}"
####################################

set :scm, :git
set :deploy_via, :remote_cache
role :app, host
set :user, 'deploy'
set :use_sudo, false
set :admin_runner, 'node_js'
default_run_options[:pty] = true

namespace :deploy do
#   task :start, :roles => :app, :except => { :no_release => true } do
#     run "start #{application}"
#   end

#   task :stop, :roles => :app, :except => { :no_release => true } do
#     run "stop #{application}"
#   end

#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "restart #{application} || #{try_sudo :as => 'root'} start #{application}"
#   end

#   task :create_deploy_to_with_sudo, :roles => :app, :except => { :no_release => true } do
#     run "mkdir -p #{deploy_to}"
#     run "chown #{admin_runner}:#{admin_runner} #{deploy_to}"
#   end

#   task :write_upstart_script, :roles => :app do
#     upstart_script = <<-UPSTART
#   description "#{application}"

#   start on startup
#   stop on shutdown

#   script
#       # We found $HOME is needed. Without it, we ran into problems
#       export HOME="/home/#{admin_runner}"

#       cd #{current_path}
#       exec sudo -u #{admin_runner} sh -c "/usr/local/bin/node #{current_path}/#{node_file} >> #{shared_path}/log/#{application}.log 2>&1"
#   end script
#   respawn
# UPSTART
#   put upstart_script, "/tmp/#{application}_upstart.conf"
#     run "#{try_sudo :as => 'root'} mv /tmp/#{application}_upstart.conf /etc/init/#{application}.conf"
#   end
end

# before 'deploy:setup', 'deploy:create_deploy_to_with_sudo'
# after 'deploy:setup', 'deploy:write_upstart_script'
