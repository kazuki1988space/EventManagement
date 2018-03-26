class Event < ApplicationRecord

  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :participant_users, through: :participants, source: :user

  validates :category, presence: true
  validates :title, presence: true, length: {maximum: 100}
  validates :content, presence: true, length: {maximum: 1000}
  validates :image, presence: true
  validates :area, presence: true
  validates :place, presence: true
  validates :date, presence: true
  validates :payment, presence: true
  validates :maxpeople, presence: true

  mount_uploader :image, ImageUploader

end
