# frozen_string_literal: true

5.times do
  job = Job.new({ title: Faker::Job.title,
                  description: Faker::Hipster.paragraph(sentence_count: 8),
                  company_name: Faker::Company.name,
                  company_email: Faker::Internet.safe_email,
                  category: Faker::Job.field,
                  deadline: Faker::Time.between(from: DateTime.now + 1,
                                                to: DateTime.now + 20,
                                                format: :default) })
  job.save

  4.times do
    JobApplication.create!({ full_name: Faker::Name.name,
                             address: "#{Faker::Address.city}, #{Faker::Address.street_address}",
                             phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                             email: Faker::Internet.safe_email,
                             education: Faker::Number.between(from: 0, to: 3),
                             job: job,
                             date_of_birth: Faker::Time.between(from: DateTime.now - 25_000,
                                                                to: DateTime.now - 4_000,
                                                                format: :default) })
  end
end
