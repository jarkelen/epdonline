class Api::V1::TreatmentsController < Api::V1::BaseController
  def index
    if params[:patient_id].blank?
      treatments = Treatment.order(created_at: :desc)
    else
      treatments = Treatment.where(patient_id: params[:patient_id]).order(created_at: :desc)
    end
    render json: treatments, status: 201
  end

  def show
    treatment = Treatment.find(params[:id])
    render json: treatment, status: 201
  end

  def create
    treatment = Treatment.create(treatment_params)
    if treatment.save
      render json: treatment, status: 201
    else
      render json: treatment.errors, status: :unprocessable_entity
    end
  end

  def update
    treatment = Treatment.find(params[:id])
    if treatment.update_attributes(treatment_params)
      render json: treatment, status: 201
    else
      render json: treatment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    treatment = Treatment.find(params[:id])
    treatment.destroy

    render json: treatment, status: 201
  end

  private

  def treatment_params
    params.permit(:treatment_date, :treatment_type, :treated_by, :name, :registered_by, :urgency, :department, :price, :price_category, :patient_id)
  end
end