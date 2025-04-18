# == Schema Information
#
# Table name: teachers
#
#  id           :bigint           not null, primary key
#  email        :string
#  kuerzel      :string
#  name         :string
#  surname      :string
#  wunschpensum :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  school_id    :bigint
#
# Indexes
#
#  index_teachers_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#
class Teacher < ApplicationRecord
  belongs_to :school
  has_many :courses

  def self.ransackable_attributes(auth_object = nil)
   ["id", "name", "surname", "email", "kuerzel", "wunschpensum", "school_id", "created_at", "updated_at"]
  end

    # Explicitly allow searchable associations
  def self.ransackable_associations(auth_object = nil)
    ["courses", "school"]  # Add all the associations that you want to be searchable
  end
end
