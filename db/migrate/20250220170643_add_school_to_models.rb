class AddSchoolToModels < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :school, foreign_key: true, null: true
    add_reference :teachers, :school, foreign_key: true, null: true
    add_reference :subjects, :school, foreign_key: true, null: true
    add_reference :school_classes, :school, foreign_key: true, null: true
    add_reference :grades, :school, foreign_key: true, null: true
  end
end
