class Subject < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "kuerzel", "created_at", "updated_at"]
      end

end
