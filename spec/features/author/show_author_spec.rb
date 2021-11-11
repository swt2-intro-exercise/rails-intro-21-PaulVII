
require 'rails_helper'

describe "Author details page", type: :feature do
  before do
    @author = FactoryBot.create(:author)
  end
    it "should have the content 'Authors'" do
      visit author_path(@author)
      expect(page).to have_content('Author')
      expect(page).to have_content('Alan')
      expect(page).to have_content('Turing')
      expect(page).to have_content('http://de.wikipedia.org/Alan_Turing')
    end
end
