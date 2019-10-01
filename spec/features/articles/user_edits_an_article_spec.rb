require 'rails_helper'

describe 'User Edits an Article' do
  describe 'they are redirected back to the articles show page' do
    it 'updates the article' do
      article = Article.create!(title: "Title 1", body: "Body 1")

      visit article_path(article)
      click_link 'Edit'

      expect(current_path).to eq(edit_article_path(article))

      fill_in 'article[title]', with: 'Title 2'
      fill_in 'article[body]', with: 'Body 2'
      click_on 'Update Article'

      expect(current_path).to eq(article_path(article))
      expect(page).to_not have_content(article.title)
      expect(page).to have_content('Title 2')
      expect(page).to have_content("Article '#{'Title 2'}' Updated!")
    end
  end
end
