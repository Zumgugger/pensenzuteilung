ActiveAdmin.register Course do
  permit_params :school_class, :teacher, :subject

  index do
    selectable_column
    id_column
    column :school_class
    column :subject
    column :teacher
    column :wochenlektionen
    actions
  end

  form do |f|
    f.inputs "Course Details" do
      f.input :school_class
      f.input :subject
      f.input :teacher
      f.input :wochenlektionen
    end
    f.actions
  end
end
