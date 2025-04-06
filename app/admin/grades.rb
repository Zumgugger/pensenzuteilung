ActiveAdmin.register Grade do

  menu label: "Altersstufe"
  
  permit_params :name, :school_id

  index title: "Altersstufe" do
    selectable_column
    id_column
    column :school
    column :name
    column :seed
    actions
  end

  
end
