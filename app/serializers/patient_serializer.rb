class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :initials, :bsn, :birthdate, :gender, :street, :housenumber, :zipcode, :city, :phone, :email, :insurance_company, :insurance_number, :startdate, :enddate, :hospital
end