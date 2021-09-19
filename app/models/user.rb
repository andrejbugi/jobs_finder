class User < ApplicationRecord
  VALID_NAME_REGEX = /\A[a-z ,.'-]+\z/i.freeze

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :full_name, presence: true,
                        format: { with: VALID_NAME_REGEX },
                        length: { minimum: 6, maximum: 128 }
end
