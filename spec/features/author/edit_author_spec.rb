require 'rails_helper'

describe "Edit author page", type: :feature do
  before :each do
    @author = FactoryBot.create(:author)
    visit edit_author_path(@author)
  end
  it "should exist at 'edit_author_path' and render withour error" do
    expect(page).to have_content "Edit Author"
  end 
  it "should have text inputs for an author's first name, last name, and homepage" do
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]', with: @author.first_name)
    expect(page).to have_field('author[last_name]', with: @author.last_name)
    expect(page).to have_field('author[homepage]', with: @author.homepage)
  end
  it 'should be able to edit an existing author' do
    id = @author.id
    # Note: the specific author was suggested by GitHub Copilot
    fill_in 'author[first_name]', with: 'J.K.'
    fill_in 'author[last_name]', with: 'Rowling'
    fill_in 'author[homepage]', with: 'http://www.jkrowling.com'
    click_button "Update Author"
    @author.reload
    expect(@author.first_name).to eq('J.K.')
    expect(@author.last_name).to eq('Rowling')
    expect(@author.homepage).to eq('http://www.jkrowling.com')
    expect(@author.id).to eq(id)
  end
  it 'should prevent faulty values' do
    # Note: the specific author was suggested by GitHub Copilot
    fill_in 'author[last_name]', with: ""
    click_button "Update Author"
    expect(page).to have_text("error")
    @author.reload
    expect(@author.last_name).not_to eq(nil)
  end
  it 'can empty fields' do
    # Note: the specific author was suggested by GitHub Copilot
    fill_in 'author[first_name]', with: ""
    click_button "Update Author"
    @author.reload
    expect(@author.first_name).to eq("")
  end
end
