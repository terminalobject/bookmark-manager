require 'web_helper'

feature 'can signup for bookmark manager' do
  scenario 'signup' do
    sign_up
    expect {sign_up}.to change(User, :count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'newmail@gmail.com'
  end
  scenario 'password and password_confirmation must match' do
    visit '/users/new'
    expect { wrong_sign_up }.to change(User, :count).by(0)
  end

  feature 'Password and password_confirmation do not match' do
    scenario 'Stays on user page to allow further attempt' do
      wrong_sign_up
      expect(current_path).to eq '/users/new'
      expect(page).to have_content 'Password and confirmation password do not match'
    end
  end
end
