class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.string :treatment_nr
      t.string :treatment_type
      t.string :treated_by
      t.string :name
      t.string :registered_by
      t.boolean :urgency
      t.string :department
      t.decimal :price
      t.string :price_category
      t.integer :hospital_id
      t.integer :patient_id

      t.timestamps
    end
    add_index :treatments, :hospital_id
    add_index :treatments, :patient_id
  end
end
