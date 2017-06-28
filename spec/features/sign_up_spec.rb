require 'web_helper'

feature 'can signup for bookmark manager' do
  scenario 'signup' do
    sign_up
    expect {sign_up}.to change(User, :count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'newmail@gmail.com'
  end
end
