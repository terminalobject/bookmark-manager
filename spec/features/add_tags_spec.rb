feature 'Add tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.facebook.com/'
    fill_in 'title', with: 'Facebook'
    fill_in 'tags',  with: 'social'

    click_button 'Add bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')
  end
end
