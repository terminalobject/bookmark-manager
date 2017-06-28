def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'newmail@gmail.com'
  fill_in :password, with: 'password'
  click_button 'Submit'
end
