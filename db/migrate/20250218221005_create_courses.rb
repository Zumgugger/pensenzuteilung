class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.references :school_class, null: true, foreign_key: true
      t.references :teacher, null: true, foreign_key: true
      t.references :subject, null: true, foreign_key: true
      t.decimal :wochenlektionen, default: 0, null: true # Allows null and sets default value

      t.timestamps
    end
  end
end
