FactoryGirl.define do
  factory :treatment do
    treatment_type "MyString"
    treated_by "MyString"
    name "MyString"
    registered_by "MyString"
    urgency false
    department "MyString"
    price "9.99"
    price_category "MyString"
    hospital_id 1
    patient_id 1
  end
end
