require 'rails_helper'

RSpec.describe 'JobApplications' do
  include Warden::Test::Helpers

  describe 'creating applications' do
    context 'when some information is missing or incorrect' do
      let(:job) { create(:job) }

      it 'will redirect to show job without saving the application' do
        post_params = {
          params: {
            job_application: {
              full_name: 'Name Name',
              email: 'email@aasdasd',
              date_of_birth: DateTime.now - 10_000,
              education: 'vss',
              job_id: job.id
            }
          }
        }

        post "/jobs/#{job.id}/job_applications", post_params

        expect(response).to redirect_to(job_path(job))
      end
    end

    context 'when the form is filled out correctly' do
      let(:job) { create(:job) }

      it 'redirects to the job and saves the application' do
        post_params = {
          params: {
            job_application: {
              full_name: 'Name Name',
              email: 'email@aasdasd.com',
              date_of_birth: DateTime.now - 10_000,
              education: 'vss',
              address: 'address 123',
              phone_number: '+122122122',
              job_id: job.id
            }
          }
        }

        post "/jobs/#{job.id}/job_applications", post_params

        expect(response).to redirect_to(job_path(job))
        follow_redirect!

        expect(response.body).to include('Successfully applied to this job')
      end
    end
  end
end
