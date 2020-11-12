class PrescriptionsController < ApplicationController

  def create
    #binding.pry
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
      flash[:messages] = ["Successfully prescribed #{@prescription.treatment.name}"]
      redirect_to user_path
    else
      flash[:errors] = @prescription.errors.full_messages if !@prescrition.valid?
    end
    redirect_back(fallback_location: treatments_path)
  end

  def destroy
    set_prescription
    @prescription.destroy
    flash[:messages] = ["Successfully removed prescription for #{@prescription.treatment.name}"]
    redirect_back(fallback_location: treatments_path)
  end

  private

  def prescription_params
    params.permit(:user_id, :treatment_id )
  end

  def set_prescription
    @prescription = Prescription.find_by_id(params[:id])
    redirect_to treatments_path if !@prescription
  end
end
