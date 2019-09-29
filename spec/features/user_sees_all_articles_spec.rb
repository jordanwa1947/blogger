require 'rails_helper'

describe 'User sees all articles' do
  describe 'User visits /articles' do
    it 'displays all articles' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit '/articles'

      expect(page).to have_content('Title 1')
      expect(page).to have_content('Body 1')
      expect(page).to have_content('Title 2')
      expect(page).to have_content('Body 2')
    end
  end
end