app_dir = File.expand_path('..', __dir__)

%w(tmp log).each do |dir|
  dir = File.expand_path(dir, app_dir)
  Dir.mkdir(dir) unless Dir.exist?(dir)
end

worker_processes  2
working_directory app_dir

timeout 30

pid    "#{app_dir}/tmp/unicorn.pid"

# stderr_path "#{app_dir}/log/unicorn.stderr.log"
# stdout_path "#{app_dir}/log/unicorn.stdout.log"
