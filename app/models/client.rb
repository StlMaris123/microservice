class Client < ApplicationRecord
  validates :api_key, presence: true
  validates :source_app, presence: true
end
