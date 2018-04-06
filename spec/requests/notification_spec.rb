require "rails_helper"

RSpec.describe Notification, type: :request do

  it "creates a Notification" do
    headers = {
      "ACCEPT" => "application/json"

    }

    post "/notifications",
      params: {
      
      notification: {
        phone: "1234567891",
        body: "My Message",
        source_app: "my_app_name"

      }

      }, headers: headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
    expect(FakeSms.messages.last.num).to eq("1234567891")
  end

  it 'responds with error for invalid attributes' do
    headers = {
      'ACCEPT' => 'application/json'
    }

    post '/notifications',
    params: {
      notification: {
        phone: "5555555555",
        body: "My Message"
      }
    }, headers: headers
  end
end
