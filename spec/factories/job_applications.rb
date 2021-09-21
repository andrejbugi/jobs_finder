FactoryBot.define do
  factory :job_application do
    full_name { 'John Johnson' }
    email { 'johnemail@email.com' }
    date_of_birth { DateTime.now - 12_000 }
    phone_number { '+123123123' }
    address { 'Address, Street 123' }
    education { 'vss' }
    job
  end
end
