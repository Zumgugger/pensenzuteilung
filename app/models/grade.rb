# == Schema Information
#
# Table name: grades
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Grade < ApplicationRecord
has_many :school_classes
    
    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "created_at", "updated_at"]
      end

      def self.ransackable_associations(auth_object = nil)
        ["school_classes"]
      end
end
