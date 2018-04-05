class Notification < ApplicationRecord
  validates :phone, presence: true, numericality: true, length: {maximum: 10, minimum: 9}
    validates :body, presence: true, length: {maximum: 500}
    validates :source_app, presence: true
end
