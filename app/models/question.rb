class Question < ApplicationRecord
  belongs_to :user
  has_many :options, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
end
