class Like < ApplicationRecord
  belongs_to :user
  belongs_to :idea, counter_cache: :likes_count

  validates :user_id, {presence: true}
  validates :idea_id, {presence: true}
end
