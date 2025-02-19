# == Schema Information
#
# Table name: subjects
#
#  id         :bigint           not null, primary key
#  kuerzel    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Subject < ApplicationRecord
  has_many :courses
    def self.ransackable_attributes(auth_object = nil)
       ["id", "name", "kuerzel", "created_at", "updated_at"]
    end

          # Explicitly allow searchable associations
    def self.ransackable_associations(auth_object = nil)
      ["courses"]  # Add all the associations that you want to be searchable
    end

end
