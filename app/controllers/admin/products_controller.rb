class Admin::ProductsController < ApplicationController

  before_action :authenticate_admin!
  before_action :prepare_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product successfully created'
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product successfully updated'
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @product.destroy
    flash[:notice] = 'Product successfully deleted'
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand_id, :description, :cost_price, :selling_price, :stock, :image)
  end

  def prepare_product
    @product = Product.find(params[:id])
  end

end
