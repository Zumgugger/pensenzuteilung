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

  # Custom action for prepopulating school classes
  collection_action :prepopulate, method: :post do
    # Retrieve all grades from the database
    grades = Grade.all

    # Data for prepopulating school classes
    #**** später von separater Tabelle importieren
    school_classes_data = [
      { name: "1a", grade_name: "7.Schuljahr" },
      { name: "1b", grade_name: "7.Schuljahr" },
      { name: "1c", grade_name: "7.Schuljahr" },
      { name: "2a", grade_name: "8.Schuljahr" },
      { name: "2b", grade_name: "8.Schuljahr" },
      { name: "2c", grade_name: "8.Schuljahr" },
      { name: "3a", grade_name: "9.Schuljahr" },
      { name: "3b", grade_name: "9.Schuljahr" },
      { name: "3c", grade_name: "9.Schuljahr" },
      { name: "4a", grade_name: "Mischlklasse" },
      { name: "5a", grade_name: "Mischlklasse" },
      { name: "6a", grade_name: "Mischlklasse" },
      { name: "7a", grade_name: "Mischlklasse" }
    ]

    # Loop through the data and create school classes
    school_classes_data.each do |data|
      grade = Grade.find_by(name: data[:grade_name])

      if grade
        # Create or find the school class for the matching grade
        school_class = SchoolClass.find_or_initialize_by(name: data[:name], grade_id: grade.id)
        unless school_class.persisted?
          if school_class.save
            Rails.logger.info "Created SchoolClass: #{school_class.name}"
          else
            Rails.logger.error "Failed to create SchoolClass: #{school_class.errors.full_messages}"
          end
        end
      else
        # Log error if grade is not found
        Rails.logger.error "Grade #{data[:grade_name]} not found"
      end
    end

    # Redirect back to the school classes index page with a success notice
    redirect_to admin_school_classes_path, notice: "School classes prepopulated successfully!"
  end

  # Action button to trigger prepopulation
  action_item :prepopulate, only: :index do
    link_to "Prepopulate School Classes", prepopulate_admin_school_classes_path, method: :post
  end
end
