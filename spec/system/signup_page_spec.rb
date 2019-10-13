# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Sign Up page', type: :system do
  before { visit '/signup' }

  let(:user) do
    User.create(name: 'Alex',
                email: Faker::Internet.email,
                password: '1324567',
                password_confirmation: '1324567')
  end

  it 'user can sign up' do
    fill_in 'Name', with: user.name
    fill_in 'Email', with: 'email_that_do@not.exists'
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Create my account'
    expect(page).to have_content(user.name)
  end
end
