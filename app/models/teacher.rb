class Teacher < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "surname", "email", "kuerzel", "wunschpensum", "created_at", "updated_at"]
      end
end
