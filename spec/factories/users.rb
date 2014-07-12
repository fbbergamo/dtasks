# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "test@exmaple"
    password "1234"
    confirm_password "1234"
  end
end
