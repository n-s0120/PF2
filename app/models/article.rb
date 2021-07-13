class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  belongs_to :user
end