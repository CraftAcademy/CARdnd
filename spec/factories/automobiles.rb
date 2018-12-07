FactoryBot.define do
  factory :automobile do
    brand { "BMW" }
    model { "V60" }
    year { 2010 }
    price { 500 }
    user
    description {'Best car in the galaxy,far far away'}
    engine {'V6'}
    rental_status {false}
  end
end
