require 'rails_helper'

describe 'User sees one article' do
  describe 'user visits /article' do
    it 'displays information for one article' do
      article = Article.create!(title: "Title 1", body: "Body 1")

      visit articles_path
      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
