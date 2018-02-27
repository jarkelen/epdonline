class Api::V1::PatientsController < Api::V1::BaseController
  swagger_controller :patients, 'Patients'

  swagger_api :index do
    summary 'All patients'
    notes 'Shows all patients available in the database.'
  end

  swagger_api :show do
    summary 'Show patient'
    notes 'Shows the details of a specific patient.'
  end

  swagger_api :create do
    summary 'Create patient'
    notes 'Creates a new patient.'
  end

  swagger_api :update do
    summary 'Update patient'
    notes 'Updates the details of a patient.'
  end

  swagger_api :destroy do
    summary 'Delete patient'
    notes 'Deletes a patient.'
  end

  def index
    patients = Patient.order(:last_name)
    render json: patients, status: 201
  end

  def show
    patient = Patient.find(params[:id])
    render json: patient, status: 201
  end

  def create
    patient = Patient.create(patient_params)
    if patient.save
      render json: patient, status: 201
    else
      render json: patient.errors, status: :unprocessable_entity
    end
  end

  def update
    patient = Patient.find(params[:id])
    if patient.update_attributes(patient_params)
      render json: patient, status: 201
    else
      render json: patient.errors, status: :unprocessable_entity
    end
  end

  def destroy
    patient = Patient.find(params[:id])
    patient.destroy

    render json: patient, status: 201
  end

  private

  def patient_params
    params.permit(:first_name, :last_name, :initials, :bsn, :birthdate, :gender, :street, :housenumber, :zipcode, :city, :phone, :email, :insurance_company, :insurance_number, :startdate, :enddate, :hospital)
  end
end