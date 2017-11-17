class ProductsController < ApplicationController

  # before_action :authenticate_customer!
  def home
  @products = Product.all
  end
  
  def index
    if customer_signed_in?
      if session[:cart]
        current_customer.add_to_cart_from_session(session[:cart])
        session[:cart] = nil
      end
    end
    @products = Product.all

    @filterrific = initialize_filterrific(
      Product,
      params[:filterrific],
      select_options: {
        sorted_by: Product.options_for_sorted_by,
        with_brand_id: Brand.options_for_select,
        with_any_category_ids: Category.options_for_select
      }
      ) or return
    @products = @filterrific.find.page(params[:page])

      respond_to do |format|
        format.js
        format.html
      end
  end

  def show
    if customer_signed_in?
      if session[:cart]
        current_customer.add_to_cart_from_session(session[:cart])
        session[:cart] = nil
      end
    end
    @product = Product.find(params[:id])
  end


end
