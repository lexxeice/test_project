# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PursesController, type: :controller do
  include SessionsHelper

  let(:user) do
    User.create(name: 'Alex',
                email: Faker::Internet.email,
                password: '1234567',
                password_confirmation: '1234567')
  end

  let(:valid_params) do
    {

      balance: 150,
      user_id: user.id
    }
  end

  subject(:purse) do
    Purse.create(valid_params)
  end

  describe 'GET#show' do
    before { get :show, params: { id: purse.id } }

    it { expect(response).to be_successful }
    it { is_expected.to render_template(:show) }
  end

  describe 'PATCH#update' do
    let(:valid_name) do
      {
        balance: 150,
        user_id: user.id
      }
    end

    let(:invalid_name) do
      {
        balance: 100,
        user_id: user.id
      }
    end

    context 'with valid params' do

      it 'updates the record in the database' do
        patch :update, params: { id: purse.id, purse: valid_name }
        expect(purse.reload.balance).to eq(150)
      end
    end

    context 'with invalid params' do

      it 'not updates the record in the database' do
        put :update, params: { id: purse.id, purse: invalid_name }
        expect(purse.reload.balance).to eq(purse.balance)
      end
    end
  end
end
