# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160809150236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patients", force: :cascade do |t|
    t.string   "initials"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "bsn"
    t.date     "birthdate"
    t.string   "gender"
    t.string   "street"
    t.string   "housenumber"
    t.string   "zipcode"
    t.string   "city"
    t.string   "phone"
    t.string   "email"
    t.string   "insurance_company"
    t.string   "insurance_number"
    t.date     "startdate"
    t.date     "enddate"
    t.string   "hospital"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.string   "treatment_nr"
    t.string   "treatment_type"
    t.string   "treated_by"
    t.string   "name"
    t.string   "registered_by"
    t.boolean  "urgency"
    t.string   "department"
    t.decimal  "price"
    t.string   "price_category"
    t.integer  "hospital_id"
    t.integer  "patient_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["hospital_id"], name: "index_treatments_on_hospital_id", using: :btree
    t.index ["patient_id"], name: "index_treatments_on_patient_id", using: :btree
  end

end
