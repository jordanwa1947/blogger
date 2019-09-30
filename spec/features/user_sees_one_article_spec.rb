require 'rails_helper'

describe 'User sees one article' do
  describe 'user visits /article' do
    it 'displays information for one article' do
      article = Article.create!(title: "Title 1", body: "Body 1")
      binding.pry 
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
end
