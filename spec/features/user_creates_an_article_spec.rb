require 'rails_helper'

describe 'User Creates an Article' do
  describe 'they visit the new article page' do
    describe 'they fill out the form' do
      it 'creates a new article' do
        visit articles_path
        click_link 'Create A New Article'

        expect(current_path).to eq(new_article_path)

        fill_in 'article[title]', with: 'New Article'
        fill_in 'article[body]', with: 'body'
        fill_in 'article[tag_list]', with: 'ruby, technology'

        click_on 'Create Article'

        expect(page).to have_content('New Article')
        expect(page).to have_content('body')
        expect(page).to have_content('Tags: ruby, technology')
      end
    end
  end
end
