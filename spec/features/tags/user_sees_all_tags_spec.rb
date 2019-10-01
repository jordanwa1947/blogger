require 'rails_helper'

describe 'User Views All Tags' do
  describe 'user visits article index page' do
    describe 'they click on the tags link' do
      it 'links to the tags index page' do
        article = Article.create!(title: 'Title', body: 'body')
        article.tags.create!(name: 'ruby')
        article.tags.create!(name: 'technology')

        visit articles_path

        click_link 'Tags'

        expect(current_path).to eq(tags_path)
        expect(page).to have_link('ruby')
        expect(page).to have_link('technology')
      end
    end
  end
end
