root = "/home/deploy/rails32/pa03/current"
working_directory root
pid "/home/deploy/rails32/pa03/shared/pids/unicorn.pid"
stderr_path "/home/deploy/rails32/pa03/shared/log/unicorn.stderr.log"
stdout_path "/home/deploy/rails32/pa03/shared/log/unicorn.stdout.log"

listen "/tmp/unicorn.pa03.sock"
worker_processes 2
timeout 30