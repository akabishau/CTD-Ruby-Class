class CustomersController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found

  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer, notice: "Customer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: "Customer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @customer.destroy
      redirect_to customers_url, notice: "The customer record was successfully deleted."
    rescue ActiveRecord::InvalidForeignKey
      flash[:alert] = "That customer record could not be deleted because the customer has orders."
      # redirect to the custormer page or back to the list as backup option
      redirect_back(fallback_location: customers_url)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      # debugger
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone, :email)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception")
      flash.alert = e.to_s
      redirect_to customers_path
    end
end
