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
require "test_helper"

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
