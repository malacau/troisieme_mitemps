class Participation < ApplicationRecord
  belongs_to :ligue
  belongs_to :user
  validates :ligue_id, uniqueness: { scope: :user_id }
end
