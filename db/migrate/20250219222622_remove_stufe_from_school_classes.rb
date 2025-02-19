class RemoveStufeFromSchoolClasses < ActiveRecord::Migration[7.2]
  def change
    remove_column :school_classes, :stufe, :string
  end
end
