class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]

  def index
    @treatments = Treatment.all
  end

  def new
    @treatment = Treatment.new
  end

  def create
    @treatment = Treatment.new(treatment_params)
    #byebug
    if @treatment.save
      redirect_to treatment_path(@treatment), notice: 'Treatment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @treatment.update(treatment_params)
      redirect_to @treatment, notice: 'Treatment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @treatment.destroy
    redirect_to treatments_url, notice: 'Treatment was successfully destroyed.'
  end

  private
    def set_treatment
      @treatment = Treatment.find_by_id(params[:id])
      redirect_to treatments_path if !@treatment
    end

    def treatment_params
      params.require(:treatment).permit(:name)
    end
end
