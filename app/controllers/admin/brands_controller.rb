class Admin::BrandsController < ApplicationController

  before_action :authenticate_admin!
  before_action :prepare_brand, only: [:edit, :update, :destroy]

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:notice] = 'Brand successfully created'
      redirect_to admin_brands_path
    else
      render :index
    end
  end

  def edit; end

  def update
    if @brand.update(brand_params)
      flash[:notice] = 'Brand successfully updated'
      redirect_to admin_brands_path
    else
      render :index
    end
  end

  def destroy
    @brand.destroy
    flash[:notice] = 'Brand sucessfully deleted'
    redirect_to admin_brands_path
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end

  def prepare_brand
    @brand = Brand.find(params[:id])
  end

end
