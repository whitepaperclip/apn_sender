# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{apn_sender}
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kali Donovan"]
  s.date = %q{2011-05-15}
  s.description = %q{Resque-based background worker to send Apple Push Notifications over a persistent TCP socket. Includes Resque tweaks to allow persistent sockets between jobs, helper methods for enqueueing APN notifications, and a background daemon to send them.}
  s.email = %q{kali.donovan@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "apn_sender.gemspec",
    "contrib/apn_sender.monitrc",
    "generators/apn_sender_generator.rb",
    "generators/templates/script",
    "init.rb",
    "lib/apn.rb",
    "lib/apn/connection/base.rb",
    "lib/apn/feedback.rb",
    "lib/apn/notification.rb",
    "lib/apn/notification_job.rb",
    "lib/apn/queue_manager.rb",
    "lib/apn/queue_name.rb",
    "lib/apn/sender.rb",
    "lib/apn/sender_daemon.rb",
    "lib/apn/tasks.rb",
    "lib/resque/hooks/before_unregister_worker.rb",
    "rails/init.rb",
    "test/helper.rb",
    "test/test_apple_push_notification.rb"
  ]
  s.homepage = %q{http://github.com/kdonovan/apple_push_notification}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Resque-based background worker to send Apple Push Notifications over a persistent TCP socket.}
  s.test_files = [
    "test/helper.rb",
    "test/test_apple_push_notification.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<resque>, [">= 0"])
      s.add_runtime_dependency(%q<resque-access_worker_from_job>, [">= 0"])
    else
      s.add_dependency(%q<resque>, [">= 0"])
      s.add_dependency(%q<resque-access_worker_from_job>, [">= 0"])
    end
  else
    s.add_dependency(%q<resque>, [">= 0"])
    s.add_dependency(%q<resque-access_worker_from_job>, [">= 0"])
  end
end

