class CreateSubjects < ActiveRecord::Migration[7.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :kuerzel

      t.timestamps
    end
  end
end
