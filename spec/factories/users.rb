# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "test@exmaple.com.br"
    password "1234"
    password_confirmation "1234"
  end
end
