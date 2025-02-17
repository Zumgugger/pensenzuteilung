ActiveAdmin.register Grade do

  menu label: "Altersstufe"
  
  permit_params :name

  index title: "Altersstufe" do
    selectable_column
    id_column
    column :name
    actions
  end

  
end
