class Message < ApplicationRecord
  belongs_to :ligue
  belongs_to :user
  validates :content, presence: true
end
