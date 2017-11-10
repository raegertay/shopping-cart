class Admin::CategoriesController < ApplicationController

  before_action :authenticate_admin!
  before_action :prepare_category, only: [:edit, :update, :destroy]


  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category successfully created!'
      redirect_to admin_categories_path  #admin/categories#index
    else
      render 'index'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category successfully updated!'
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Category successfully deleted!'
<<<<<<< HEAD
    redirect_to admin_categories_path
=======
    redirect_to admin_categories_paths
>>>>>>> 2a6b4989683f326c35b75c2db3a87001aa65c7ac
  end

  private

  def prepare_category
<<<<<<< HEAD
    @category = Category.find(params[:id])
=======
    @category = Category.find[params[:id]]
>>>>>>> 2a6b4989683f326c35b75c2db3a87001aa65c7ac
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
