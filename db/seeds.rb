# frozen_string_literal: true

10.times do
  Job.create({ title: Faker::Job.title,
               description: Faker::Hipster.paragraph(sentence_count: 2),
               company_name: Faker::Company.name,
               company_email: Faker::Internet.safe_email,
               category: Faker::Job.field,
               deadline: Faker::Time.between(from: DateTime.now + 1,
                                             to: DateTime.now + 20,
                                             format: :default) })
end

30.times do
  JobApplication.create!({ full_name: Faker::Name.name,
                           address: "#{Faker::Address.city}, #{Faker::Address.street_address}",
                           phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                           email: Faker::Internet.safe_email,
                           education: Faker::Number.between(from: 0, to: 3),
                           date_of_birth: Faker::Time.between(from: DateTime.now - 25_000,
                                                              to: DateTime.now - 4_000,
                                                              format: :default) })
end
