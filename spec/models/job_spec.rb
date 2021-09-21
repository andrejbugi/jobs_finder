require 'rails_helper'

RSpec.describe Job do
  describe 'associations' do
    it { is_expected.to have_many(:job_applications) }

    describe 'dependency' do
      let(:job_applications_count) { 2 }
      let(:job) { create(:job) }

      it 'destroys job applications' do
        create_list(:job_application, job_applications_count, job: job)

        expect { job.destroy }.to change { JobApplication.count }.by(-job_applications_count)
      end
    end
  end
end
