# == Schema Information
#
# Table name: schools
#
#  id         :bigint           not null, primary key
#  location   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class School < ApplicationRecord
    has_many :school_classes
    has_many :subjects
    has_many :teachers
    has_many :users
    has_many :grades
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "location", "name", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["teachers", "subjects", "school_classes", "users", "grades"]  # Add all the associations that you want to be searchable
    end
end
