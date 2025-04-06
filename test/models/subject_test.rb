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
require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
