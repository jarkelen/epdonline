class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.where(hospital: params[:hospital]).order(:last_name)
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @hospital = params[:hospital]
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
    @hospital = @patient.hospital

  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient is succesvol aangemaakt' }
        format.json { render :show, status: :created, location: @patient }
      else
        @hospital = params[:hospital]
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient is successfully gewijzigd' }
        format.json { render :show, status: :ok, location: @patient }
      else
        @hospital = @patient.hospital
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient is succesvol verwijderd' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:hospital, :initials, :housenumber, :first_name, :last_name, :bsn, :birthdate, :gender, :street, :zipcode, :city, :phone, :email, :insurance_company, :insurance_number, :startdate, :enddate)
    end
end
