class Membership < ApplicationRecord
  validates_uniqueness_of :client_id, scope: :gym_id

  belongs_to :gym
  belongs_to :client
end
