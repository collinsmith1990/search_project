FactoryGirl.define do
  factory :search_term do
    sequence(:content) { |n| "example#{n}" }
  end
end

