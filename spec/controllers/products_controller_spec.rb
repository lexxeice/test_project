require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  include SessionsHelper

  let(:valid_params) do
    {

      title: 'Apple',
      description: 'Green apple from Necropolis',
      price: 15

    }
  end

  let(:invalid_params) do
    {
      title: nil,
      description: nil,
      price: nil
    }
  end

  let(:product) do
    Product.create(valid_params)
  end

  describe 'GET#new' do
    before { get :new }

    it { expect(response).to be_successful }
    it { is_expected.to render_template(:new) }
  end

  describe 'GET#show' do
    before { get :show, params: { id: product.id } }

    it { expect(response).to be_successful }
    it { is_expected.to render_template(:show) }
  end

  describe 'POST#create' do
    context 'with permitting params' do
      it {
        expect(product).to permit(:title, :description, :price)
          .for(:create, params: { product: valid_params })
          .on(:product)
      }
    end

    context 'with valid params' do
      before { post :create, params: { product: valid_params } }

      it { is_expected.to redirect_to assigns(:product) }
    end

    context 'with invalid params' do
      before { post :create, params: { product: invalid_params } }

      it { is_expected.to render_template(:new) }
    end
  end

  describe 'PATCH#update' do
    let(:valid_name) do
      {
        title: 'Apple',
        description: 'Green apple from Necropolis',
        price: 15
      }
    end

    let(:invalid_name) do
      {
        title: 'Apple',
        description: 'Green apple from Necropolis',
        price: 10
      }
    end

    context 'with valid params' do

      it 'updates the record in the database' do
        patch :update, params: { id: product.id, product: valid_name }
        expect(product.reload.price).to eq(15)
      end
    end

    context 'with invalid params' do

      it 'not updates the record in the database' do
        put :update, params: { id: product.id, product: invalid_name }
        expect(product.reload.price).to eq(product.price)
      end
    end
  end
end
