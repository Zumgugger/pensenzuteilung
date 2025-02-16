class CreateLehrkrafts < ActiveRecord::Migration[7.2]
  def change
    create_table :lehrkrafts do |t|
      t.string :name
      t.string :kuerzel
      t.integer :wunschpensum
      t.integer :aktuelles_pensum

      t.timestamps
    end
  end
end
