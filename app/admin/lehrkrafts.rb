ActiveAdmin.register Lehrkraft do
  menu label: "Lehrkräfte"

  permit_params :name, :kuerzel, :wunschpensum, :aktuelles_pensum

  index title: "Lehrkräfte" do
    selectable_column
    id_column
    column :name
    column :kuerzel
    column :wunschpensum
    column :aktuelles_pensum
    actions
  end
end
