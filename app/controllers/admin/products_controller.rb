class Admin::ProductsController < ApplicationController

  before_action :authenticate_admin!
  before_action :prepare_product, only: [:show, :edit, :update, :destroy, :destroy_image, :swap_image_position, :change_image]
  before_action :prepare_image, only: [:destroy_image, :swap_image_position, :change_image]

  def index
    @filterrific = initialize_filterrific(
      Product,
      params[:filterrific],
      select_options: {
        sorted_by: Product.options_for_sorted_by
      }
      ) or return
    @products = @filterrific.find.page(params[:page])

      respond_to do |format|
        format.js
        format.html
      end

    rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return
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
      @image.destroy
      @product.order_images
      flash[:notice] = 'Image sucessfully deleted'
      redirect_to edit_admin_product_path(params[:id])
    end

    def swap_image_position
      @product.images.find_by(image_params).update(position: @image.position)
      @image.update(image_params)
      flash[:notice] = 'Image sucessfully swapped'
      redirect_to edit_admin_product_path(params[:id])
    end

    def change_image
      @image.update(image_params)
      flash[:notice] = 'Image successfully changed'
      redirect_to edit_admin_product_path(params[:id])
    end

    private

    def product_params
      params.require(:product).permit(:name, :brand_id, :category_id, :description, :cost_price, :selling_price, :stock, category_ids: [])
    end

    def image_params
      params.require(:image).permit(:position, :url)
    end

    def image_url
      url = params.require(:product).permit(:images)[:images]
      url.match(/^http/) ? url : nil
    end

    def prepare_product
      @product = Product.find(params[:id])
    end

    def prepare_image
      @image = Image.find(params[:image_id])
    end

  end
