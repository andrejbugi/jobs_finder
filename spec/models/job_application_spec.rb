require 'rails_helper'

RSpec.describe JobApplication do
  describe 'associations' do
    it { should belong_to(:job).class_name('Job') }
  end

  describe 'validations' do
    it { should validate_presence_of(:full_name) }
  end

  context 'when job status is expired' do
    describe 'applicants' do
      let(:expired_job) { create(:job, deadline: DateTime.now - 1) }
      let(:active_job) { create(:job, deadline: DateTime.now + 1) }

      it 'should not be able to apply' do
        invalid_job_application = JobApplication.new(job_id: expired_job.id, full_name: 'Name Test', email: 'emailasda@email.com',
                                                     date_of_birth: DateTime.now - 10_000, education: 'vss',
                                                     phone_number: '+123123123', address: 'Address, Street 123')
        valid_job_application = JobApplication.new(job_id: active_job.id, full_name: 'Name Test', email: 'emailasda@email.com',
                                                   date_of_birth: DateTime.now - 10_000, education: 'vss',
                                                   phone_number: '+123123123', address: 'Address, Street 123')
        # expect { job_application.save }.to raise :abort
        expect { invalid_job_application.save }.to change { JobApplication.count }.by 0
        expect { valid_job_application.save }.to change { JobApplication.count }.by 1
      end
    end
  end
end

