class SchoolClass < ApplicationRecord

  validates :stufe, inclusion: { in: Grade.pluck(:name), message: "%{value} is not a valid grade level" }

    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "stufe", "created_at", "updated_at"]
      end
end
