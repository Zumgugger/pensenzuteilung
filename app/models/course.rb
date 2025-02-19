class Course < ApplicationRecord
  belongs_to :teacher, optional: true
  belongs_to :school_class, optional: true
  belongs_to :subject, optional: true

  validate :at_least_one_reference
  validates :jahreslektionen, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  # Explicitly allow searchable attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "school_class_id", "subject_id", "teacher_id", "updated_at", "wochenlektionen"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["school_class", "subject", "teacher"]
  end
  private

  def at_least_one_reference
    if teacher.nil? && school_class.nil? && subject.nil?
      errors.add(:base, "Um einen Kurs zu erstellen muss entweder Klasse, Fach oder Lehkraft definiert sein")
    end
  end
end
