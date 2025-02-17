ActiveAdmin.register Teacher do
  permit_params :name, :surname, :email, :kuerzel, :wunschpensum


  
  menu label: "Lehrkraefte"


  # Optional: Customize the index table
  index title: "Lehrkraefte" do
    selectable_column
    id_column
    column :name
    column :surname
    column :email
    column :kuerzel
    column :wunschpensum
    actions
  end

  # Optional: Customize the form
  form do |f|
    f.inputs 'Teacher Details' do
      f.input :name
      f.input :surname
      f.input :email
      f.input :kuerzel
      f.input :wunschpensum, input_html: { value: 0 } # Default to 0
    end
    f.actions
  end
end
