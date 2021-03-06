# Slight modifications from the default Resque tasks
namespace :apn do
  task :setup
  task :work => :sender
  task :workers => :senders

  desc "Start an APN worker"
  task :sender => :setup do
    require 'apn'

    worker = APN::Sender.new(:full_cert_path => ENV['FULL_CERT_PATH'], :cert_path => ENV['CERT_PATH'], :environment => ENV['ENVIRONMENT'], :cert_pass => ENV['CERT_PASS'], :pro => ENV['PRO'])
    worker.verbose = ENV['LOGGING'] || ENV['VERBOSE']
    worker.very_verbose = ENV['VVERBOSE']

    worker.work(ENV['INTERVAL'] || 5) # interval, will block

    puts "*** Starting worker to send apple notifications in the background from #{worker}"
  end

  desc "Start multiple APN workers. Should only be used in dev mode."
  task :senders do
    threads = []

    2.times do |n|
      threads << Thread.new do
        system "rake apn:work#{n == 1 ? ' PRO=true' : ''}"
      end
    end

    threads.each { |thread| thread.join }
  end
end
