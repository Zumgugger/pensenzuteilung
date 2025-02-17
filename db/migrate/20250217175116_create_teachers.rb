class CreateTeachers < ActiveRecord::Migration[7.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :kuerzel
      t.integer :wunschpensum, default: 0

      t.timestamps
    end
  end
end
