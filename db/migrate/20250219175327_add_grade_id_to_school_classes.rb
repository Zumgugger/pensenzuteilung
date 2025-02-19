class AddGradeIdToSchoolClasses < ActiveRecord::Migration[7.2]
  def change
    add_reference :school_classes, :grade, null: true, foreign_key: true
  end
end
