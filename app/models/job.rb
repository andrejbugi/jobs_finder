class Job < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :title, presence: true, length: { minimum: 6, maximum: 128 }
  validates :description, presence: true, length: { minimum: 6, maximum: 2024 }
  validates :company_name, presence: true, length: { minimum: 6, maximum: 64 }
  validates :company_email,
            presence: true,
            length: { maximum: 64 },
            format: { with: VALID_EMAIL_REGEX, message: 'valid email address' }
  validates :category, presence: true, length: { maximum: 64 }
  validates :deadline, presence: true
  validates :status, presence: true

  enum status: { active: 1, expired: 0 }

  has_many :job_applications, inverse_of: :job, dependent: :destroy
  accepts_nested_attributes_for :job_applications
end
