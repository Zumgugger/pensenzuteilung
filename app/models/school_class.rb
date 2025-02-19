# == Schema Information
#
# Table name: school_classes
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  grade_id   :bigint
#
# Indexes
#
#  index_school_classes_on_grade_id  (grade_id)
#
# Foreign Keys
#
#  fk_rails_...  (grade_id => grades.id)
#
class SchoolClass < ApplicationRecord
  belongs_to :grade
  has_many :courses

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "grade_id" "created_at", "updated_at"]
  end

  # Explicitly allow searchable associations
  def self.ransackable_associations(auth_object = nil)
    ["courses", "grade"]  # Add all the associations that you want to be searchable
  end
end
