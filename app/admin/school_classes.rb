ActiveAdmin.register SchoolClass do
  permit_params :name, :grade_id, :school_id

  index title: "Schulklassen" do
    selectable_column
    id_column
    column :school
    column :name
    column :grade
    actions
  end
end
