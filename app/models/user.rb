class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages

  enum status: { available: 0, busy: 1, away: 2 }, _prefix: true

  validates :username, presence: true
  validates :status, presence: true
end
