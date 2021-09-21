require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    it { is_expected.to validate_length_of(:full_name).is_at_most(128) }

    context 'when using invalid email format' do
      it 'is invalid' do
        john = build(:user, email: 'TEST@TESt')

        expect(john.valid?).to be false
      end
    end
  end
end
