class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true

  # def thumbnail
  #   return self.image.variant(resize: '100*100')
  # end

  # def image_type
  # if image.attached? && image.content_type.in?(%("image/jpeg image/png image/jpg"))
  #   errors.add(:image, 'error message')
  # elsif !image.attached?
  #   errors.add(:image, 'error message')
  # end
end
