require 'pg'

feature 'viewing bookmarks' do
  scenario 'expect to be able to view bookmarks page' do
    visit('/')
    click_button 'Bookmarks'
    expect(page).to have_content('Bookmarks Page')
  end


  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Learning code ting');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy the ting');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Find the tings');")

    visit('/')
    click_button 'Bookmarks'

    expect(page).to have_link('Learning code ting', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy the ting', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Find the tings', href: 'http://www.google.com')
  end
end