class Lehrkraft < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
      ["id", "name", "kuerzel", "wunschpensum", "aktuelles_pensum", "created_at", "updated_at"]
    end
  end
  