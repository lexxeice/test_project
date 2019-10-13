# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Log In page', type: :system do
  before { visit '/login' }

  context 'when user is logs in ' do
    let(:user) do
      User.create(name: 'Alex',
                  email: Faker::Internet.email,
                  password: '1324567',
                  password_confirmation: '1324567')
    end

    it 'logs user in' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content('Alex')
    end
  end
end
