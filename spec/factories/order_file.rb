FactoryBot.define do
  factory :order_file do
    token            {"tok_abcdefghijk00000000000000000"}
    postal_code      {"123-4567"}
    shopping_area_id {1}
    city             {"横浜市緑区"}
    address          {"青山1-1-1"}
    number           {"09012345678"}
    user_id          {1}
    item_id          {1}
  end
end
