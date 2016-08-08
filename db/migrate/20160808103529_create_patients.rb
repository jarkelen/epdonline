class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :bsn
      t.date :birthdate
      t.string :gender
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :phone
      t.string :email
      t.string :insurance_company
      t.integer :insurance_number
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end
end
