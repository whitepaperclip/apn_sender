module APN
  # Change this to modify the queue from which notification jobs are pushed and pulled
  @@queue_name = :apple_push_notifications

  def self.queue_name
    @@queue_name
  end

  def self.queue_name= name
    @@queue_name = name.to_sym
  end
end
