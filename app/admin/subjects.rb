ActiveAdmin.register Subject do
    menu label: "Fächer"

    permit_params :name, :kuerzel, :school_id

    index title: "Fächer" do
      selectable_column
      id_column
      column :school
      column :name
      column :kuerzel
      column :seed
      actions
    end

    collection_action :delete_all, method: :post do
      Subject.destroy_all
      redirect_to admin_subjects_path, notice: "Alle Fächer wurden gelöscht"
    end

    # Custom action for populating default subjects with 'name' and 'kürzel'
    # **** später von separater Tabelle importieren
    collection_action :prepopulate, method: :post do
      school = School.first

      default_subjects = [
        { name: "Mathematik", kuerzel: "M" },
        { name: "Deutsch", kuerzel: "D" },
        { name: "Französisch", kuerzel: "F" },
        { name: "Englisch", kuerzel: "E" },
        { name: "Naturkunde Technik", kuerzel: "NT" },
        { name: "Raum Zeit Gesellschaft", kuerzel: "RZG" },
        { name: "Wirtschaft Arbeit Haushalt", kuerzel: "WAH" },
        { name: "Musik", kuerzel: "Mu" },
        { name: "Bildnerisches Gestalten", kuerzel: "BG" },
        { name: "Technisches Textiles Gestalten", kuerzel: "TTG" },
        { name: "Technisches Gestalten", kuerzel: "TG" },
        { name: "Ethik Religion Gemeinschaft", kuerzel: "ERG" },
        { name: "Individuelle Vertiefung und Erweiterung", kuerzel: "IVE" },
        { name: "Medien und Informatik", kuerzel: "MUI" },
        { name: "Sport", kuerzel: "S" },
        { name: "Flexibilisierung 9. Schuljahr", kuerzel: "FX9" }
      ]

      default_subjects.each do |subject_data|
        Subject.find_or_create_by(subject_data.merge(school_id: school&.id))
      end
      redirect_to admin_subjects_path, notice: "Subjects prepopulated successfully!"
    end

  action_item :delete_all, only: :index do
    link_to "Delete All Subjects", delete_all_admin_subjects_path, method: :post, data: { confirm: "Are you sure?" }
  end

  action_item :prepopulate, only: :index do
    link_to "Prepopulate Subjects", prepopulate_admin_subjects_path, method: :post
  end
end
