ActiveAdmin.register Subject do

    menu label: "Fächer"
  
    permit_params :name, :kuerzel, :wunschpensum, :aktuelles_pensum
  
    index title: "Fächer" do
      selectable_column
      id_column
      column :name
      column :kuerzel
      actions
    end
  
end
