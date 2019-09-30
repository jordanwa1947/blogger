require 'rails_helper'

describe 'User sees one article' do
  describe 'user visits /article' do
    it 'displays information for one article' do
      article = Article.create!(title: "Title 1", body: "Body 1")

      comment_1 = article.comments.create(author_name: 'Jordan', body: 'body_1')
      comment_2 = article.comments.create(author_name: 'Tyler', body: 'body_2')

      visit articles_path
      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end

  describe 'User fills in comment form' do
    it 'creates a comment under the article' do
      article = Article.create!(title: "New Title", body: "New Body")

      visit article_path(article)

      fill_in 'comment[author_name]', with: 'me'
      fill_in 'comment[body]', with: 'so awesome'

      click_on 'Submit'

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content('Post a Comment')
      expect(page).to have_content('me')
      expect(page).to have_content('so awesome')
    end
  end
end
