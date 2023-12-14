require 'rails_helper'

RSpec.describe "Orders", type: :request do

  let(:customer) { FactoryBot.create(:customer) }
  let(:order) { FactoryBot.create(:order, customer: customer) } # using the same customer
  let(:valid_attributes) { FactoryBot.attributes_for(:order, customer_id: customer.id) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:order, customer_id: customer.id, product_name: nil) }

  describe "GET /orders" do
    it "returns http success" do
      get orders_path
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET /orders/:id" do
    it "returns http success" do
      get order_path(order)
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET /orders/new" do
    it "returns http success" do
      get new_order_path
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET /orders/:id/edit" do
    it "returns http success" do
      get edit_order_path(order)
      expect(response).to have_http_status(:success)
    end
  end


  describe "POST /orders" do
    
    context "with valid attributes" do
      it "creates a new order and redirects to the order's page" do
        expect {
          post orders_path, params: { order: valid_attributes }
        }.to change(Order, :count).by(1)

        expect(response).to redirect_to(order_path(Order.last))
      end
    end

    context "with invalid attributes" do
      it "does not create a new order and renders the new template" do
        expect {
          post orders_path, params: { order: invalid_attributes }
        }.to change(Order, :count).by(0)

        expect(response).to render_template(:new)
      end
    end
  end


  describe "PUT /orders/:id" do

    context "with valid data" do
      let(:new_attributes) { { product_count: 50 } }

      it "updates an entry and redirects to the show path for the order" do
        put order_path(order), params: { order: new_attributes }
        order.reload
        expect(order.product_count).to eq(50)
        expect(response).to redirect_to(order_path(order))
      end
    end

    context "with invalid data" do
      let(:invalid_update_attributes) { { customer_id: nil } }

      it "does not update the order and renders the edit template" do
        put order_path(order), params: { order: invalid_update_attributes }
        order.reload
        expect(order.customer_id).to eq(customer.id)
        expect(response).to render_template(:edit)
      end
    end
  end


  describe "DELETE /orders/:id" do
    it "deletes the order and redirects to the orders list" do
      delete order_path(order)
      expect(response).to redirect_to(orders_path)
      expect(Order.exists?(order.id)).to be false
    end
  end
end
