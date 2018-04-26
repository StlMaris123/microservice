require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'creation' do
    it 'can be created 'do
      client = FactoryBot.build_stubbed(:client)
      expect(client).to be_valid
    end

    it 'has a unique source app' do
        first_client = Client.create(source_app: "app_name", api_key: "I384fHtD1h9XZvs4fGPJUgtt")
        duplicate_client = Client.create(source_app: "app_name", api_key: "I384fHtD1h9XZvs4fGPJUgtt")
        expect(duplicate_client).to_not be_valid
    end
  end

  describe 'callbacks' do
    it 'will automatically have an api key when created' do
      client = Client.create(source_app: "app name")
      expect(client.api_key).to_not be_nil
    end
  end
end
