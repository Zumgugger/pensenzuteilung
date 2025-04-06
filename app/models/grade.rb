# == Schema Information
#
# Table name: grades
#
#  id         :bigint           not null, primary key
#  name       :string
#  seed       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :bigint
#
# Indexes
#
#  index_grades_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#
class Grade < ApplicationRecord
belongs_to :school
has_many :school_classes
    
    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "school_id", "created_at", "updated_at", "seed"]
      end

      def self.ransackable_associations(auth_object = nil)
        ["school_classes", "school"]
      end
end
