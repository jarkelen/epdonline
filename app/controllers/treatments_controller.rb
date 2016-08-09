class TreatmentsController < ApplicationController

  def index
    @treatments = Treatment.where(hospital: params[:hospital]).order(:last_name).includes(:treatments)
  end

  def new
    @treatment = Treatment.new
    @patient = Patient.find(params[:patient])
  end

  def edit
    @treatment = Treatment.find(params[:id])
    @patient = Patient.find(params[:patient])
  end

  def create
    @treatment = Treatment.new(treatment_params)

    respond_to do |format|
      if @treatment.save
        format.html { redirect_to patient_path(@treatment.patient), notice: 'Behandeling is successvol aangemaakt' }
        format.json { render :show, status: :created, location: @treatment }
      else
        @patient = Patient.find(params[:patient])
        format.html { render :new }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @treatment = Treatment.find(params[:id])
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to patient_path(@treatment.patient), notice: 'Behandeling is successvol gewijzigd' }
        format.json { render :show, status: :ok, location: @treatment }
      else
        @patient = Patient.find(params[:patient])
        format.html { render :edit }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @treatment = Treatment.find(params[:id])
    hospital = @treatment.hospital
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url(hospital: hospital), notice: 'Behandeling is successvol verwijderd' }
      format.json { head :no_content }
    end
  end

  private def treatment_params
    params.require(:treatment).permit(:treatment_date, :treatment_type, :treated_by, :name, :registered_by, :urgency, :department, :price, :price_category, :patient_id)
  end
end
