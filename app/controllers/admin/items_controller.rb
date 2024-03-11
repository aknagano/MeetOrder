class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!
  def new
    @item = Item.new
    @production_areas = ProductionArea.all
  end
  
  def create
      @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      @production_areas = ProductionArea.all
      render :new
    end
  end
  
  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
    @production_areas = ProductionArea.all
  end
  
  def update
    @item = Item.find(params[:id])
     if @item.update(item_params)
       redirect_to admin_item_path(@item.id)
     else
       @item = Item.find(params[:id])
       @production_areas = ProductionArea.all
       render :edit
     end
  end

  def show
    @item = Item.find(params[:id])
  end
  
   private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :production_area_id)
  end
end
