

class AddGradeLevels < ActiveRecord::Migration[6.1]
  def up
    school = School.first_or_create!(name: "Default School", location: "Unknown")

    grade_levels = [
      '1. Klasse',
      '2. Klasse',
      '3. Klasse',
      '4. Klasse',
      '5. Klasse',
      '6. Klasse',
      '7. Klasse',
      '8. Klasse',
      '9. Klasse',
      'Mischklasse'
    ]


    grade_levels.each do |level|
      Grade.create!(name: level, school: school)
    end
  end

  def down
    Grade.delete_all
  end
end
