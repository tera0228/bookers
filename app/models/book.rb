class Book < ApplicationRecord
  # バリデーションの設定
  validates :title, presence: true
  validates :body, presence: true
end
