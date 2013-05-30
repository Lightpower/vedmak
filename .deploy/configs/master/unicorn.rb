rails_env  = ENV['RAILS_ENV'] || 'production'
rails_root = File.expand_path(Dir.pwd)

working_directory rails_root
worker_processes  1
pid               File.join(rails_root, 'tmp', 'pids', 'unicorn.pid')
stderr_path       File.join(rails_root, 'log', 'unicorn.log')

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

timeout 120
listen  File.join(rails_root, "tmp/sockets/unicorn.sock"), :backlog => 1024