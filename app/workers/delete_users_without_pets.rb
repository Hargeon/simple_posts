class DeleteUsersWithoutPets
  include Sidekiq::Worker
  queue_as :delete_users_without_pets

  def perform
    users = User.where('created_at <= ? and (pets_count = ? or pets_count is NULL)', 1.month.ago, 0)
    users.destroy_all
  end
end
