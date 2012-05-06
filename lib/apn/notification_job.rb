module APN
  # This is the class that's actually enqueued via Resque when user calls +APN.notify+.
  # It gets added to the +apple_server_notifications+ Resque queue, which should only be operated on by
  # workers of the +APN::Sender+ class.
  class NotificationJob
    # Build a notification from arguments and send to Apple
    @queue = :apple_push_notifications

    def self.perform(token, opts)
      puts "APN::NotificationJob @queue: #{@queue}"
      msg = APN::Notification.new(token, opts)
      raise "Invalid notification options (did you provide :alert, :badge, or :sound?): #{opts.inspect}" unless msg.valid?
      raise "APN::NotificationJob was picked up by a non-APN:Sender resque worker. Aborting." unless worker
      worker.send_to_apple( msg )
    end


    # Only execute this job in specialized APN::Sender workers, since
    # standard Resque workers don't maintain the persistent TCP connection.
    extend Resque::Plugins::AccessWorkerFromJob
    self.required_worker_class = 'APN::Sender'
  end

  class ProNotificationJob
    # Build a notification from arguments and send to Apple
    @queue = :apple_push_notifications_pro

    def self.perform(token, opts)
      puts "APN::NotificationJob @queue: #{@queue}"
      msg = APN::Notification.new(token, opts)
      raise "Invalid notification options (did you provide :alert, :badge, or :sound?): #{opts.inspect}" unless msg.valid?
      raise "APN::NotificationJob was picked up by a non-APN:Sender resque worker. Aborting." unless worker
      worker.send_to_apple( msg )
    end


    # Only execute this job in specialized APN::Sender workers, since
    # standard Resque workers don't maintain the persistent TCP connection.
    extend Resque::Plugins::AccessWorkerFromJob
    self.required_worker_class = 'APN::Sender'
  end
end
