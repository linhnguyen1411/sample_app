class Micropost < ApplicationRecord
  belongs_to :user
  # scope :feed, ->(user) do
  #   where("user_id IN (:following_ids) OR user_id = :user_id",
  #     user_id: user.id, following_ids: user.following_ids)
  # end
  scope :feed, ->(user){where "user_id IN (?) OR user_id = ?", user.following_ids, user.id}
  default_scope ->{order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validate  :picture_size

  private

  def picture_size
    return if picture.size < 5.megabytes
    errors.add(:picture, "should be less than 5MB")
  end
end
