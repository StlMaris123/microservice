require 'rails_helper'

RSpec.describe 'API KEY' do
  describe 'creation' do
    it 'can be created' do
      key = ApiKey.generator
      expect(key).to be_kind_of(String)
    end
  end
end
