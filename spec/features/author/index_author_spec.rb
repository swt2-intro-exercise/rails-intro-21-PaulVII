require 'rails_helper'

describe "Author index page", type: :feature do
  before :each do
    FactoryBot.create(:author)
    FactoryBot.create(:author)
    visit authors_path
  end
  it "should exist at 'author_path' and render withour error" do
  end
  it "Should include a link to the create page" do
    expect(page).to have_link 'New', href: new_author_path
  end
  it 'Sbould include a table of all authors' do
    expect(page).to have_selector 'table'
    expect(page).to have_selector 'th', text: 'Name'
    expect(page).to have_selector 'th', text: 'Homepage'
    expect(page).to have_selector 'td', text: Author.first.name
    expect(page).to have_selector 'td', text: Author.last.name
    expect(page).to have_selector 'tr', count: 3
  end
  it 'Should link to the individual author\'s page' do
    expect(page).to have_link 'Details', href: author_path(Author.first)
  end
  it 'Should link to the individuals author\'s edit page' do
    expect(page).to have_link 'Edit', href: edit_author_path(Author.first)
  end
end