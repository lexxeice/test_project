# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purse, type: :model do
  let(:user) do
    User.create(name: 'Alex',
                email: Faker::Internet.email,
                password: '1234567',
                password_confirmation: '1234567')
  end

  subject(:purse) do
    Purse.new(balance: 0, user_id: user.id)
  end

  describe '#balance' do
    it { is_expected.to validate_presence_of(:balance) }
    it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end

  describe '#user_id' do
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
