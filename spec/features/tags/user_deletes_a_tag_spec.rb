require 'rails_helper'

describe 'User Deletes a Tag' do
  describe 'user visits an articles show page' do
    describe 'user clicks delete button' do
      it 'delete the tag' do
        article = Article.create(title: 'Title', body: 'body')
        article.tags.create(name: 'ruby')
        tag = article.tags.create(name: 'technology')

        visit tag_path(tag)
        click_link 'Delete'

        expect(current_path).to eq(tags_path)
        expect(page).to_not have_content('technology')
        expect(page).to have_content('ruby')
      end
    end
  end
end
