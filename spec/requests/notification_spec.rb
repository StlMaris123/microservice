require "rails_helper"

RSpec.describe Notification, type: :request do
  before do
    client = FactoryBot.create(:client)
    @headers = {
      "ACCEPT" => "application/json",
      "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials(client.source_app, client.api_key)

    }
  end

  it "creates a Notification" do

    post "/notifications",
      params: {
      
      notification: {
        phone: "1234567891",
        body: "My Message",
        source_app: "my_app_name"

      }

      }, headers: @headers


    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
    expect(FakeSms.messages.last.num).to eq("1234567891")
  end

  it 'responds with error for invalid attributes' do

    post '/notifications',
    params: {
      notification: {
        phone: "5555555555",
        body: "My Message",
      }
    }, headers: @headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
