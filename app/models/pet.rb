class Pet < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id', counter_cache: :pets_count
end
