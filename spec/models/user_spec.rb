# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.create(name: 'Alex',
                email: Faker::Internet.email,
                password: '',
                password_confirmation: '')
  end

  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
  end

  describe '#email' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(250) }
    it { is_expected.to allow_value('example@yandex.ru').for(:email) }
  end

  describe '#password' do
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end
end
