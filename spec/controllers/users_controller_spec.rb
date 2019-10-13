# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include SessionsHelper

  let(:valid_params) do
    {

      name: 'Alex Mad',
      email: 'john.doe@example.com',
      password: '1234567',
      password_confirmation: '1234567'

    }
  end

  let(:invalid_params) do
    {
      name: nil,
      email: nil,
      password: nil,
      password_confirmation: nil
    }
  end

  let(:user) do
    User.create(valid_params)
  end

  describe 'GET#new' do
    before { get :new }

    it { expect(response).to be_successful }
    it { is_expected.to render_template(:new) }
  end

  describe 'GET#show' do
    before { get :show, params: { id: user.id } }

    it { expect(response).to be_successful }
    it { is_expected.to render_with_layout('application') }
    it { is_expected.to render_template(:show) }
  end

  describe 'POST#create' do
    context 'with permitting params' do
      it {
        expect(user).to permit(:name, :email, :password, :password_confirmation)
          .for(:create, params: { user: valid_params })
          .on(:user)
      }
    end

    context 'with valid params' do
      before { post :create, params: { user: valid_params } }

      it { is_expected.to redirect_to assigns(:user) }
    end

    context 'with invalid params' do
      before { post :create, params: { user: invalid_params } }

      it { is_expected.to render_template(:new) }
    end
  end

  describe 'PATCH#update' do
    let(:valid_name) do
      {
        name: 'Makar',
        password: 'password',
        password_confirmation: 'password'

      }
    end

    let(:invalid_name) do
      {
        name: 'M',
        password: '1234567',
        password_confirmation: '1234567'
      }
    end

    context 'with valid params' do
      before { log_in user }

      it 'updates the record in the database' do
        patch :update, params: { id: user.id, user: valid_name }
        expect(user.reload.name).to eq('Makar')
      end
    end

    context 'with invalid params' do
      before { log_in user }

      it 'not updates the record in the database' do
        put :update, params: { id: user.id, user: invalid_name }
        expect(user.reload.name).to eq(user.name)
      end
    end
  end
end
