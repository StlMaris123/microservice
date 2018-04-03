class Notification < ApplicationRecord
  validates_presence_of :phone, :source_app, :body
end
