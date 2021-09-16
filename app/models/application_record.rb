class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def allow_id_override?
    false
  end

  before_create :set_uuid

  private

  def set_uuid
    return if !has_attribute?(:id) || (allow_id_override? && !id.nil?)

    self.id = SecureRandom.uuid
  end
end
