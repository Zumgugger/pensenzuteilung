
class AddSeedToMultipleTables < ActiveRecord::Migration[7.2]
  def change
    add_column :school_classes, :seed, :boolean, default: false
    add_column :subjects,       :seed, :boolean, default: false
    add_column :grades,         :seed, :boolean, default: false
    add_column :courses,        :seed, :boolean, default: false
  end
end
  