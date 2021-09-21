FactoryBot.define do
  factory :job do
    title { 'New Job' }
    description { Faker::Hipster.paragraph(sentence_count: 8) }
    company_name { 'Johnson Company' }
    company_email { 'companyemail@email.com' }
    category { 'random category' }
    deadline { DateTime.now + 2 }
    status { 'active' }
  end
end
