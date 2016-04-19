rails_env = ENV['RAILS_ENV'] || "development"
environment rails_env

daemonize
pidfile './tmp/pids/server.pid'
# logfile
puma_logfile = rails_env == 'production' ? './log/production.log' : './log/development.log'
stdout_redirect puma_logfile, puma_logfile, true

threads 8,32
workers 1

# listen port
puma_port = rails_env == 'production' ? '8001' : '3000'
bind "tcp://127.0.0.1:#{puma_port}"
# bind 'unix:///var/run/puma.sock'
quiet

