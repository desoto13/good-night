class User < ApplicationRecord
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users
  has_many :sleep_records

  validates :name, uniqueness: true, presence: true

  def friends_sleep_records
    SleepRecord.joins(:user).where(users: { id: followed_user_ids })
  end
end
