class Question < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: {maximum: 500}
end
