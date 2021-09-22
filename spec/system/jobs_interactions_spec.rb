require 'rails_helper'

RSpec.describe 'JobsInteractions', type: :system do
  include Warden::Test::Helpers

  let(:user) { create(:user) }
  let(:job) { create(:job) }

  before do
    driven_by :selenium, using: :chrome

    Warden.test_mode!
    login_as user, scope: :user

    visit root_path
  end

  describe 'Creating a job' do
    it 'creates and shows the new job' do
      click_on('New Job')

      within('form#form-model') do
        fill_in 'Title', with: job.title
        fill_in 'Description', with: job.description
        fill_in 'Company name', with: job.company_name
        fill_in 'Company email', with: job.company_email
        fill_in 'job_deadline', with: job.deadline
        fill_in 'Category', with: job.category
      end

      click_on('Add New Job')

      expect(page).to have_content(job.title)
    end
  end

  describe 'Editing a job' do
    it 'Edits the job and shows it' do
      visit job_path(job)

      click_on('Edit Job')

      within('form#form-model') do
        fill_in 'Title', with: 'New Title of The Job'
      end

      click_on('Save Job')

      expect(page).to have_content('New Title of The Job')
    end
  end

  describe 'Deleting an job' do
    it 'deletes the job and redirect to root_path' do
      visit job_path(job)

      click_on 'Delete'

      expect(page).to have_content('Available Jobs for You!')
    end
  end
end

