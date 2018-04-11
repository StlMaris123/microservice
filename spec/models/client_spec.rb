require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'creation' do
    it 'can be created 'do
      client = FactoryBot.build_stubbed(:client)
      expect(client).to be_valid
    end
  end
end
