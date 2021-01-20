FactoryBot.define do
  factory :item do
    name               {Faker::Lorem.sentence}
    explain            {Faker::Lorem.sentence}
    category_id        {1}
    condition_id       {1}
    price              {300}
    shopping_charge_id {1}
    shopping_area_id   {1}
    days_to_ship_id    {1}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-logo-white.png'), filename: 'furima-logo-white.png')
    end

  end
end
