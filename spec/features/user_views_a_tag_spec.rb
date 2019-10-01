require 'rails_helper'

describe "User views a Tag's Show Page" do
  describe 'user clicks on a tag link next to an article' do
    it 'links to the tag show page' do
      article = Article.create!(title: "New Title", body: "New Body")
      tag = article.tags.create!(name: "Name")

      visit article_path(article)
      click_link tag.name

      expect(current_path).to eq(tag_path)
      expect(page).to have_content(article.title)
      expect(page).to have_content(tag.name)
    end
  end
end
