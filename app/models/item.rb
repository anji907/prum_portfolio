class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :learning_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
