require 'csv'

class UserInfoWorker
  include Sidekiq::Worker

  def perform(from, to)
    array = []
    User.where('created_at >= ? and created_at <= ?', from, to).find_in_batches do |group|
      group.each { |user| array << user }
    end
    SendUserInfoMailer.with(users: array).send_info.deliver_later
  end
end
