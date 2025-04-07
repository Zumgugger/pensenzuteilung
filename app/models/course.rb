# == Schema Information
#
# Table name: courses
#
#  id              :bigint           not null, primary key
#  seed            :boolean          default(FALSE)
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
class Course < ApplicationRecord
  belongs_to :teacher, optional: true
  belongs_to :school_class, optional: true
  belongs_to :subject, optional: true

  validate :at_least_one_reference
  # Explicitly allow searchable attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "school_class_id", "subject_id", "teacher_id", "updated_at", "wochenlektionen", "seed" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "school_class", "subject", "teacher" ]
  end
  private

  def at_least_one_reference
    if teacher.nil? && school_class.nil? && subject.nil?
      errors.add(:base, "Um einen Kurs zu erstellen muss entweder Klasse, Fach oder Lehkraft definiert sein")
    end
  end

  def school
    school_class&.school.name
end
end
