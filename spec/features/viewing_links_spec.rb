feature 'Viewing links' do
  before(:each) do	
	  Link.create(url: 'http://www.google.com/', title: 'Google', tags: [Tag.first_or_create(name: 'useful')])
	  Link.create(url: 'http://www.facebook.com/', title: 'Facebook', tags: [Tag.first_or_create(name: 'social')])
	  Link.create(url: 'http://www.datamapper.org/', title: 'Datamapper', tags: [Tag.first_or_create(name: 'mustread')])
  end 

  scenario 'I can see existing links on the links page' do
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
  scenario 'I can filter links by tag' do
    visit '/tags/social'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).not_to have_content('Google')
      expect(page).not_to have_content('Datamapper')
      expect(page).to have_content('Facebook')
    end 
  end
end 
