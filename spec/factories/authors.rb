FactoryBot.define do
  factory :author do
    first_name { "Alan" }
    last_name { "Turing" }
    homepage { "http://de.wikipedia.org/Alan_Turing" }
  end
  factory :author2 do
    first_name { "Alan2" }
    last_name { "Turing2" }
    homepage { "http://de.wikipedia.org/Alan_Turing2" }
  end
end
