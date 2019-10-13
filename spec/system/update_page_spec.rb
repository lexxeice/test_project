# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Things user sees on the update page', type: :system do
  let(:user) do
    User.create(name: 'Alex',
                email: Faker::Internet.email,
                password: '1324567',
                password_confirmation: '1324567')
  end

  before do
    sign_in(user)
    visit edit_user_path(user)
  end

  it 'Update my information' do
    fill_in 'Name', with: 'Test'
    fill_in 'Password', with: '1234567'
    fill_in 'Password confirmation', with: '1234567'

    click_button 'Save changes'
    expect(page).to have_content('Test')
  end
end
