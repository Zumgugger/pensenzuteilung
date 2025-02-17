ActiveAdmin.register SchoolClass do

    menu label: "Klasse"
  
    permit_params :name, :stufe
  
    index title: "Klasse" do
      selectable_column
      id_column
      column :name
      column :stufe
      actions
    end

    
    form do |f|
      f.inputs 'SchoolClass Details' do
        f.input :name
        f.input :stufe, as: :select, collection: Grade.pluck(:name), prompt: "Wähle eine Altersstufe"
      end
      f.actions
    end

end

