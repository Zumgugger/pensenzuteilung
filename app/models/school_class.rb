# == Schema Information
#
# Table name: school_classes
#
#  id         :bigint           not null, primary key
#  name       :string
#  seed       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  grade_id   :bigint
#  school_id  :bigint
#
# Indexes
#
#  index_school_classes_on_grade_id   (grade_id)
#  index_school_classes_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (grade_id => grades.id)
#  fk_rails_...  (school_id => schools.id)
#
class SchoolClass < ApplicationRecord
  belongs_to :school
  belongs_to :grade
  has_many :courses

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "grade_id", "school_id", "created_at", "updated_at", "seed"]
  end

  # Explicitly allow searchable associations
  def self.ransackable_associations(auth_object = nil)
    ["courses", "grade", "school"]  # Add all the associations that you want to be searchable
  end
end
