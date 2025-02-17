class CreateSchoolClasses < ActiveRecord::Migration[7.2]
  def change
    create_table :school_classes do |t|
      t.string :name
      t.string :stufe

      t.timestamps
    end
  end
end
