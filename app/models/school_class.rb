class SchoolClass < ApplicationRecord
  has_many :courses
  # Wrap the query in a lambda to delay the evaluation
  validates :stufe, inclusion: { in: ->(school_class) { Grade.pluck(:name) }, message: "%{value} is not a valid grade level" }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "stufe", "created_at", "updated_at"]
  end

  # Explicitly allow searchable associations
  def self.ransackable_associations(auth_object = nil)
    ["courses"]  # Add all the associations that you want to be searchable
  end
end
