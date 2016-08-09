class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.date :treatment_date
      t.string :treatment_type
      t.string :treated_by
      t.string :name
      t.string :registered_by
      t.string :urgency
      t.string :department
      t.decimal :price
      t.string :price_category
      t.integer :patient_id

      t.timestamps
    end
    add_index :treatments, :patient_id
  end
end
