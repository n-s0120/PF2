# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :reports, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def reported_by?(user)
    reports.where(user_id: user.id).exists?
  end

  acts_as_taggable
end
