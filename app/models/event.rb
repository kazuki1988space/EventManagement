class Event < ApplicationRecord

  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :participant_users, through: :participants, source: :user

  validates :category, presence: true, length: {maximum: 15}
  validates :title, presence: true, length: {maximum: 80}
  validates :content, presence: true, length: {maximum: 1000}
  validates :image, presence: true
  validates :area, presence: true, length: {maximum: 15}
  validates :place, presence: true, length: {maximum: 80}
  validates :date, presence: true
  validates :payment, presence: true, length: {in: 1..8}, numericality: { greater_than_or_equal_to: 0 }
  validates :maxpeople, presence: true, length: {in: 1..5}, numericality: { greater_than_or_equal_to: 1 }

  mount_uploader :image, ImageUploader

end
