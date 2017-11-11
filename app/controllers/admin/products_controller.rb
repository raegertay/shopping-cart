class Admin::ProductsController < ApplicationController

  before_action :authenticate_admin!
  before_action :prepare_product, only: [:show, :edit, :update, :destroy, :destroy_image]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      @product.add_image(image_url)
      flash[:notice] = 'Product successfully created'
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      @product.add_image(image_url)
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

  def destroy_image
    @product.images.find(params[:image_id]).destroy
    @product.reorder_images
    flash[:notice] = 'Image sucessfully deleted'
    redirect_to edit_admin_product_path(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand_id, :category_id, :description, :cost_price, :selling_price, :stock, category_ids: [])
  end

  def image_url
    params.require(:product).permit(:images)[:images]
  end

  def prepare_product
    @product = Product.find(params[:id])
  end

end
