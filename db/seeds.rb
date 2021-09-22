# frozen_string_literal: true

2.times do
  job = Job.new({ title: Faker::Job.title,
                  description: Faker::Hipster.paragraph(sentence_count: 8),
                  company_name: Faker::Company.name,
                  company_email: Faker::Internet.safe_email,
                  category: Faker::Job.field,
                  deadline: Faker::Time.between(from: DateTime.now - 1,
                                                to: DateTime.now + 20,
                                                format: :default) })
  job.save

  3.times do
    j = JobApplication.new({ full_name: Faker::Name.name,
                                 address: "#{Faker::Address.city}, #{Faker::Address.street_address}",
                                 phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                                 email: Faker::Internet.safe_email,
                                 education: Faker::Number.between(from: 0, to: 3),
                                 job: Job.first,
                                 documents: '',
                                 date_of_birth: Faker::Time.between(from: DateTime.now - 25_000,
                                                                     to: DateTime.now - 4_000,
                                                                    format: :default) })

    # downloaded_image = open("https://source.unsplash.com/300x300/?#{j.full_name}")
    # j.documents = [downloaded_image]
    j.save
  end
end

user = User.new({ full_name: Faker::Name.name,
                  email: 'user@email.com',
                  password: '12341234',
                  password_confirmation: '12341234' })

user.save

user1 = User.new({ full_name: Faker::Name.name,
                   email: 'user1@email.com',
                   password: '12341234',
                   password_confirmation: '12341234' })

user1.save

puts "users' emails are: #{user1.email}, #{user.email}, passwords for both of these are: 12341234"
