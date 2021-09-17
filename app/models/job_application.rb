class JobApplication < ApplicationRecord
  VALID_NAME_REGEX = /\A[a-z ,.'-]+\z/i.freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  VALID_PHONE_NUMBER_REGEX = /\A[0-9*#+]+\z/.freeze

  validates :full_name, presence: true,
                        format: { with: VALID_NAME_REGEX },
                        length: { minimum: 6, maximum: 128 }
  validates :date_of_birth, presence: true
  validates :email, presence: true,
                    length: { maximum: 64 },
                    format: { with: VALID_EMAIL_REGEX, message: 'valid email address' }
  validates :phone_number, presence: true,
                           length: { maximum: 16 },
                           format: { with: VALID_PHONE_NUMBER_REGEX, message: '- no spaces or letters allowed' }
  validates :address, presence: true
  validates :education, presence: true

  enum education: { vss: 0, všs: 1, sss: 2, nk: 3 }
end
