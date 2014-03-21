# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rodo_cte do
    number 1
    emitted_at "2014-03-21 15:11:42"
    series "MyString"
    amount 1.5
    weight 1.5
    cnpj 1
  end
end
