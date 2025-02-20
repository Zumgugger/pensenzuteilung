# == Schema Information
#
# Table name: grades
#
#  id         :bigint           not null, primary key
#  name       :string
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
require "test_helper"

class GradeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
