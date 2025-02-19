# == Schema Information
#
# Table name: courses
#
#  id              :bigint           not null, primary key
#  wochenlektionen :decimal(, )      default(0.0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  school_class_id :bigint
#  subject_id      :bigint
#  teacher_id      :bigint
#
# Indexes
#
#  index_courses_on_school_class_id  (school_class_id)
#  index_courses_on_subject_id       (subject_id)
#  index_courses_on_teacher_id       (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_class_id => school_classes.id)
#  fk_rails_...  (subject_id => subjects.id)
#  fk_rails_...  (teacher_id => teachers.id)
#
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
