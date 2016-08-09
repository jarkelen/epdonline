class PatientsController < ApplicationController

  def index
    @patients = Patient.where(hospital: params[:hospital]).order(:last_name).includes(:treatments)
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
    @hospital = params[:hospital]
  end

  def edit
    @patient = Patient.find(params[:id])
    @hospital = @patient.hospital
  end

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

  def update
    @patient = Patient.find(params[:id])
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient is successvol gewijzigd' }
        format.json { render :show, status: :ok, location: @patient }
      else
        @hospital = @patient.hospital
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    hospital = @patient.hospital
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url(hospital: hospital), notice: 'Patient is succesvol verwijderd' }
      format.json { head :no_content }
    end
  end

  private def patient_params
    params.require(:patient).permit(:hospital, :initials, :housenumber, :first_name, :last_name, :bsn, :birthdate, :gender, :street, :zipcode, :city, :phone, :email, :insurance_company, :insurance_number, :startdate, :enddate)
  end
end
