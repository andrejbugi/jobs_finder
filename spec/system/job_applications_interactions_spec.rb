require 'rails_helper'

RSpec.describe 'JobApplicationsInteractions', type: :system do
  let(:job) { create(:job) }
  let(:job_application) { create(:job_application) }

  before do
    driven_by :selenium, using: :chrome

    visit root_path
  end

  describe 'Creating a job application' do
    it 'creates the job application and shows the job' do
      visit job_path(job)

      within('form#application') do
        fill_in 'Full name', with: job_application.full_name
        fill_in 'job_application_date_of_birth', with: job_application.date_of_birth
        fill_in 'Email', with: job_application.email
        fill_in 'Phone number', with: job_application.phone_number
        fill_in 'Address', with: job_application.address
        select 'Visa strucna sprema', from: 'Education'
      end

      click_on('Submit proposal')

      expect(page).to have_content(job.title)
    end
  end

end
