# frozen_string_literal: true

15.times do
  Job.create({ title: Faker::Job.title,
               description: Faker::Hipster.paragraph(sentence_count: 2),
               company_name: Faker::Company.name,
               company_email: Faker::Internet.safe_email,
               category: Faker::Job.field,
               deadline: Faker::Time.between(from: DateTime.now + 1,
                                             to: DateTime.now + 20,
                                             format: :default) })
end
