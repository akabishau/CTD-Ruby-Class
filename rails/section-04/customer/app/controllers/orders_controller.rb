class OrdersController < ApplicationController


  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end


  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: "Order was was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
  end


  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:product_name, :product_count, :customer_id)
    end
end
