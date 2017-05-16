class Note < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true
  self.per_page=5
end
