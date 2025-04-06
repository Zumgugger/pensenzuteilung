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
require "test_helper"

class SchoolClassTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
