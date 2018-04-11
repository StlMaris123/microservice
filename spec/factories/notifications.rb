FactoryBot.define do
  factory :notification do
    phone "123456789"
    body "First Message"
    source_app "some-app"
  end

  factory :second_notification, class: 'Notification' do
    phone "987456321"
    body "Second message"
    source_app "some-app"
  end

  factory :outside_notification, class: 'Notification' do
    phone "237456321"
    body "Second message"
    source_app "outside-app"
  end
end
