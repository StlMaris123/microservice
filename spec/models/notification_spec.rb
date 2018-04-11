require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'creation' do
    it 'can be created' do
      notification = FactoryBot.build_stubbed(:notification)
      expect(notification).to be_valid
    end
  end

  describe 'creation with invalid attributes' do
    it 'should raise validation errors' do
      notification = FactoryBot.build_stubbed(:notification)
      notification.phone = nil
      notification.body = nil
      notification.source_app = nil
      expect(notification).not_to be_valid
    end
  end

  describe 'relationships' do
    it 'has a connection to a client based on the source app attributes' do
      client = Client.create(source_app: "my_app", api_key: "Ted3P3YCxAaFB59utVO37Qtt")
      notification = client.notifications.create!(phone: "123456789", body: "just testing staff")
      expect(notification.source_app).to eq('my_app')
    end
  end
end
