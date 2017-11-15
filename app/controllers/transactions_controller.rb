class TransactionsController < ApplicationController
  before_action :authenticate_customer!
  before_action :check_cart!

  # Other Code
  def new
    gon.client_token = generate_client_token
  end

  def create
    @result = Braintree::Transaction.sale(
      amount: current_customer.cart_total_price,
      payment_method_nonce: params[:payment_method_nonce])
      if @result.success?
        order = current_customer.purchase_products!
        redirect_to order_path(order), notice: "Congralations! Your transaction is successful!"
      else
        flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
        gon.client_token = generate_client_token
        render :new
      end
    end

    def redirect_to_cart
      redirect_to cart_path
    end


    private
    def generate_client_token
      Braintree::ClientToken.generate
    end

    def check_cart!
      if current_customer.cart_items.blank?
        redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
      end
    end
  end
