class Multiplier < ApplicationRecord
  belongs_to :profile

  # LIMIT = 4

  # validate_on_create do |record|
  #   record.validate_quota
  # end

  # def validate_quota
  #   return unless self.profile
  #   if self.profile.multipliers(:reload).count >= LIMIT
  #     errors.add(:base, :exceeded_quota)
  #   end
  # end
end
