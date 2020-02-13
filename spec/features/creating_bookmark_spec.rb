feature 'adding bookmarks' do
  scenario 'expect to be able to add bookmarks page and see them' do
    visit('/bookmarks/new')
    fill_in 'url', with: 'https://www.github.com'
    fill_in 'title', with: 'That code place'
    click_button "Submit"

    expect(page).to have_link('That code place', href: 'https://www.github.com')
  end
end