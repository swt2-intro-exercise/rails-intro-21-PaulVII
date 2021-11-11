require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end
  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end
  it 'should be able to create a new author' do
    visit new_author_path
    # Note: the specific author was suggested by GitHub Copilot
    fill_in 'author[first_name]', with: 'J.K.'
    fill_in 'author[last_name]', with: 'Rowling'
    fill_in 'author[homepage]', with: 'http://www.jkrowling.com'
    click_button 'Save Author'
  end
  it 'should actually create an author in the db' do
    visit new_author_path
    expect(Author.count).to eq(0)
    # Note: the specific author was suggested by GitHub Copilot
    fill_in 'author[first_name]', with: 'J.K.'
    fill_in 'author[last_name]', with: 'Rowling'
    fill_in 'author[homepage]', with: 'http://www.jkrowling.com'
    click_button 'Save Author'
    expect(Author.count).to eq(1)
  end
  it 'should prevent faulty authers to be inserted' do
    visit new_author_path
    expect(Author.count).to eq(0)
    # Note: the specific author was suggested by GitHub Copilot
    fill_in 'author[first_name]', with: 'J.K.'
    fill_in 'author[homepage]', with: 'http://www.jkrowling.com'
    click_button 'Save Author'
    expect(page).to have_text("error")
    expect(Author.count).to eq(0)
  end
end
