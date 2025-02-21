ActiveAdmin.register Course do
  permit_params :school_class_id, :teacher_id, :teacher_kuerzel, :subject_id, :wochenlektionen

  index do
    selectable_column
    id_column
    column :school_class
    column :subject
    column "Teacher", :teacher do |course|
      course.teacher&.kuerzel
    end
    
    column :wochenlektionen
    actions
  end

  form do |f|
    f.inputs "Course Details" do
      f.input :school_class
      f.input :subject
      f.input :teacher, as: :select, collection: Teacher.all.map { |t| [t.kuerzel, t.id] }
      f.input :wochenlektionen
    end
    f.actions
  end
end
