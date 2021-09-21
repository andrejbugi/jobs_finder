require 'rails_helper'

RSpec.describe 'Jobs' do
  include Warden::Test::Helpers

  describe 'Creating an job' do
    context 'when no user is logged in' do
      it 'redirects back to login screen' do
        post_params = {
          params: {
            job: {
              title: 'Title title',
              description: 'Description that is longer'
            }
          }
        }

        post '/jobs', post_params

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'Editing an job' do
    context 'when user is logged in' do
      let(:user) { create(:user) }
      let(:job) { create(:job) }

      it 'can edit the job' do
        get '/users/sign_in'
        expect(response).to have_http_status(:ok)

        Warden.test_mode!
        login_as user, scope: :user

        expect(response).to have_http_status(:ok)

        get "/jobs/#{job.id}"
        expect(response).to have_http_status(:ok)

        get "/jobs/#{job.id}/edit"
        expect(response).to have_http_status(:ok)

        patch_params = {
          params: {
            job: {
              title: job.title,
              description: 'New description set to test out editing',
              company_name: 'Johnson Company',
              company_email: 'companyemail@email.com',
              category: 'random category',
              deadline: DateTime.now + 2,
              status: 'active'
            }
          }
        }

        patch "/jobs/#{job.id}", patch_params

        expect(response).to have_http_status(:found)

        expect(response).to redirect_to(job_path(job.id))
        follow_redirect!

        expect(response.body).to include('New description set to test out editing')
      end
    end
  end

  describe 'Deleting an job' do
    context 'when there is logged in User' do
      let(:user) { create(:user) }
      let(:job) { create(:job) }

      it 'can delete the job' do
        Warden.test_mode!
        login_as user, scope: :user

        delete "/jobs/#{job.id}"

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when no user is logged in' do
      let(:job) { create(:job) }

      it 'redirect back to root path' do
        delete "/jobs/#{job.id}"

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
