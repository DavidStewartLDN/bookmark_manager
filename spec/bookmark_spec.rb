require "bookmark"

describe Bookmark do

  describe ' #all' do
    it 'should return bookmarks list' do

      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Learning code ting');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy the ting');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Find the tings');")

      bookmarks = Bookmark.all

      expect(bookmarks[0]).to include("Learning code ting")
      expect(bookmarks[1]).to include('Destroy the ting')
      expect(bookmarks[2]).to include('Find the tings')
    end
  end

  describe '#create' do
    it 'adds a bookmark to database' do
      
      # bookmark = Bookmark.create('https://www.github.com', 'That code place').first
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark').first

      expect(bookmark['url']).to eq 'http://www.testbookmark.com'
      expect(bookmark['title']).to eq 'Test Bookmark'
    end
  end

end