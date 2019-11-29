class SendMsgWorker
  include Sidekiq::Worker
  
  sidekiq_options retry: 5
  sidekiq_retry_in do |count, exception|
    10
  end

  def perform
    user = User.find!(id: -1)
  end
end
