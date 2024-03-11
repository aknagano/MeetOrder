class Admin::ProductionAreasController < ApplicationController
   before_action :authenticate_admin!
   
  def index
    @production_area = ProductionArea.new
    @production_areas = ProductionArea.all
  end
  
  def create
      @production_area =ProductionArea.new(production_area_params)
    if @production_area.save
      redirect_to admin_production_areas_path
    else
      @production_area = ProductionArea.new
      @production_areas = ProductionArea.all
      render :index
    end
  end

  def edit
    @production_area = ProductionArea.find(params[:id])
  end
  
  def update
    @production_area = ProductionArea.find(params[:id])
    if @production_area.update(production_area_params)
      redirect_to admin_production_areas_path
    else
      @production_area = ProductionArea.find(params[:id])
      render :edit
    end
  end
  
   private
  def production_area_params
    params.require(:production_area).permit(:name)
  end
end
