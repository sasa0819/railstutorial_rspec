class User < ApplicationRecord
  validates :username, presence: true
  has_many :microposts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def feed
    Micropost.where("user_id = ?", id)
  end
end
