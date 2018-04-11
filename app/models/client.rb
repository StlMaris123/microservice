class Client < ApplicationRecord
  validates :api_key, presence: true
  validates :source_app, presence: true

  has_many :notifications, foreign_key: 'source_app', primary_key: 'source_app'
end
