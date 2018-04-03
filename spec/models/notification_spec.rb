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
end
