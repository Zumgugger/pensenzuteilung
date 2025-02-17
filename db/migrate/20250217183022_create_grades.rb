class CreateGrades < ActiveRecord::Migration[7.2]
  def change
    create_table :grades do |t|
      t.string :name

      t.timestamps
    end
  end
end
