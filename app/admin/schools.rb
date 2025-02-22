ActiveAdmin.register School do
  permit_params :name, :location

  index do
    selectable_column
    id_column
    column :name
    column :location
    column "Teachers" do |school|
      # Display the teachers for the current school
      school.teachers.map(&:name).join(", ")
    end
    actions
  end

  filter :name
  filter :location
  filter :teachers_name, as: :select, collection: -> { Teacher.pluck(:name, :id) }


  form do |f|
    f.inputs "School Details" do
      f.input :name
      f.input :location
    end
    f.actions
  end
end
