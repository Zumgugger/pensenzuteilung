# == Schema Information
#
# Table name: subjects
#
#  id         :bigint           not null, primary key
#  kuerzel    :string
#  name       :string
#  seed       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :bigint
#
# Indexes
#
#  index_subjects_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#
class Subject < ApplicationRecord
  belongs_to :school
  has_many :courses
    def self.ransackable_attributes(auth_object = nil)
       ["id", "name", "kuerzel", "school_id", "created_at", "updated_at", "seed"]
    end

          # Explicitly allow searchable associations
    def self.ransackable_associations(auth_object = nil)
      ["courses", "school"]  # Add all the associations that you want to be searchable
    end

end
