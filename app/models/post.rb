class Post < ApplicationRecord
    belongs_to :user 
    has_one_attached :picture , dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :picture, presence: true

end
