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
end
